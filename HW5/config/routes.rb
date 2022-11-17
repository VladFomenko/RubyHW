# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#index'

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end

end
