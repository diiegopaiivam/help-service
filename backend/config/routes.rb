Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  namespace :api do
    namespace :v1 do
      get 'comments/index'
      get 'comments/show'
      get 'comments/update'
      get 'comments/destroy'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :employees
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
