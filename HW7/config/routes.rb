# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'authors#index'
      resources :authors do
        resources :articles do
          get :unpublished, :published, :last_ten_comments
          resources :likes
        end
        resources :comments do
          resources :likes
        end
      end
    end
  end
end
