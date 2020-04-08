# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'
  resources :top, only: [:index]
  resources :tweets, only: [:index]
  resources :users, only: %i[new create]
  resources :comments, only: %i[create destroy]
  resources :tags, only: %i[create]
  get 'login' => 'users#login_form'
  get 'signup' => 'users#new'
end
