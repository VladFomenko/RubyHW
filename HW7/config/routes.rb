# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'authors#index'
      resources :authors do
        resources :articles, :comments
      end
    end
  end
end
