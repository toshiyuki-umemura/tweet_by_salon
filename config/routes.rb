Rails.application.routes.draw do
  root 'top#index'
  resources :top, only: [:index]
  resources :tweets, only: [:index]
end
