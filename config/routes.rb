# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :top, only: [:index]
  resources :tweets, only: [:index]
  resources :users, only: %i[new create]
  resources :comments, only: %i[create destroy]
  resources :tags, only: %i[create]
  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end
  get 'tweets/new' => 'tweets#new'
  post 'tweets/create' => 'tweets#create'
end
