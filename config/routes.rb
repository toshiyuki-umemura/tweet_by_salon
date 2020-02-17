Rails.application.routes.draw do
  root 'top#index'
  resources :top, only: [:index]
  resources :tweets, only: [:index]
  resources :users, only: %i[new create]
  resources :comments, only: %i[create destroy]
  resources :tags, only: %i[create]
  get '/log-in' => 'top#log-in'
end
