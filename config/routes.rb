Rails.application.routes.draw do
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  post 'import_users', to: 'users#import_users'
end

