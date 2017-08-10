Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :course_result do
  # Custom routes for courses
    get '/courses', to: 'course_result#show'
    get '/courses/history', to: 'course_result#history'
  end

  resources :source_provider
end
