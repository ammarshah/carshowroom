Rails.application.routes.draw do
  get "cars_all" => "cars#all", :as => "cars_all"
  get "cars_used_cars" => "cars#used_cars", :as => "used_cars"
  get "cars_new_cars" => "cars#new_cars", :as => "new_cars"
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :cars
  resources "contacts", only: [:new, :create]
  
  namespace :admin do
  	resources :cars
  end

end
