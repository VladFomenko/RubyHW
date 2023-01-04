Rails.application.routes.draw do
  get 'carts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get '/cart', to: 'carts#show', as: :cart
  resources :products, only: %i[index show]
  resources :categories
  resources :line_items, only: :create
end
