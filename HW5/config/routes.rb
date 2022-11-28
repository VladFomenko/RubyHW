# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'articles#index'
      resources :articles
    end
  end
end
