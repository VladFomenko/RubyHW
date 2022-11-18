# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api/v1/articles#index'

  namespace :api do
    namespace :v1 do
      root 'articles#index'
      resources :articles
    end
  end

end
