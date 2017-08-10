class SourceProvidersController < JSONAPI::ResourceController
=begin
  before_action :set_test, only: [:show]

  # GET /source_providers
  def index
    @source_providers = SourceProvider.where(active: true)

    render json: @source_providers
  end

  # GET /source_providers/1
  def show
    render json: @source_provider
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test
    begin
      @source_provider = SourceProvider.where(active: true).find(params[:id])
    rescue ActiveRecord::RecordNotFound => exception
      record_not_found(exception)
    end
  end

  protected
  def record_not_found(exception)
    render json: {error: exception.message}.to_json, status: 404
    return
  end
=end
end
