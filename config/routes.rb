# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :items, only: %i[index new create edit update destroy]
    resources :order_details, path: 'order-details', only: %i[index show]
  end

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'items#index'
  resources :items, only: %i[index show]
  resources :carts, only: %i[index destroy]
  resources :cart_items, only: %i[create destroy]
  resources :orders, only: %i[create]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
