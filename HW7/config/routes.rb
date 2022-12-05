# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'authors#index'
      resources :authors do
        resources :articles do
          get :unpublished, :published, :last_ten
        end
        resources :comments
      end
    end
  end
end
