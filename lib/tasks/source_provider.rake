namespace :source_provider do
  desc ''
  task :default => :update

  #Sets up logging - should only be called from other rake tasks
  desc ''
  task setup_logger: :environment do
    logger           = Logger.new(STDOUT)
    logger.level     = Logger::INFO
    Rails.logger     = logger
  end

  desc 'update course results'
  task update: :environment do
    source = SourceProvider.find_by(name: 'nbrb').url

    # Set up connection options
    conn = Faraday.new(url: source) do |faraday|
      faraday.request  :url_encoded
    end

    # new_currency_rates should contains last courses which will be pushed into db
    new_currency_rates = {}

    %w(usd eur rub).each do |curency|
      response = JSON.parse(Faraday.get(source + '/' + curency, ParamMode: 2).body)

      # filters
      new_currency_rates[curency] = response['Cur_OfficialRate'].to_f
      new_currency_rates[curency] /=  response['Cur_Scale']
    end

    # Push values into db
    CourseResult.create(
      usd: new_currency_rates['usd'],
      eur: new_currency_rates['eur'],
      rur: new_currency_rates['rub']
    )
  end
end
