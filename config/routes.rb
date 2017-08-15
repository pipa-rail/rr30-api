Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :course_results

  resource :courses do
    get '/', to: 'course_results#show'
    get '/history', to: 'course_results#history'
  end

  resources :source_providers
end
