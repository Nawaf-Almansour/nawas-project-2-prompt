Rails.application.routes.draw do

   root to: "books#home"
   resources :order_details
  resources :carts
  resources :books
  resources :orders
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
