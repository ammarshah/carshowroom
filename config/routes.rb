Rails.application.routes.draw do
  
  root to: 'visitors#index'  
  get "cars_all" => "cars#all", :as => "cars_all"
  get "cars_used_cars" => "cars#used_cars", :as => "used_cars"
  get "cars_new_cars" => "cars#new_cars", :as => "new_cars"
  get 'search', to: 'search#search'

  devise_for :users
  resources :users, :photos
  resources :cars
  resources "contacts", only: [:new, :create]
  
  namespace :admin do
  	resources :cars
  end

end
