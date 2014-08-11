Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :cars
  resources "contacts", only: [:new, :create]
end
