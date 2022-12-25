# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      root 'articles#index'
      resources :authors do
        resources :articles do
          get :unpublished, :published, :last_ten_comments
          post :search_current_value, :filtration_articles, :sorting_articles
          resources :likes, only: %i[index create update]
        end
        resources :comments do
          resources :likes, only: %i[index create update]
        end
      end
    end
  end
end
