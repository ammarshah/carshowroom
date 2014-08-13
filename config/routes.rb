Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources "contacts", only: [:new, :create]
  resources :cars
  namespace :admin do
  	resources :cars
  end
end
