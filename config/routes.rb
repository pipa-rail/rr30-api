Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :course_results do
  # Custom routes for courses
    get '/courses', to: 'course_results#show'
    get '/courses/history', to: 'course_results#history'
  end

  resources :source_providers
end
