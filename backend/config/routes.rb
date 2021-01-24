Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  namespace :api do
    namespace :v1 do
      resources :employees
      resources :comments

      get "ratings/:employee_id", to: 'ratings#show'
      post "ratings", to:'ratings#create'

      get "connections/:employee_id", to: 'connections#index'
      post "connections", to: 'connections#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
