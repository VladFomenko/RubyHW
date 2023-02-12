require 'sidekiq/web'

Rails.application.routes.draw do
  # for show emails
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # get 'carts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  authenticate :admin_user do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart
  resources :products, only: %i[index show]

  resources :categories

  # post 'line_items/:id/change_quantity', to: 'line_items#change_quantity', as: 'line_item_change_quantity'
  resources :line_items

  get 'order/:id/paid', to: 'orders#paid', as: 'paid'
  resources :orders, only: %i[index create show]
end
