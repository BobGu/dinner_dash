Rails.application.routes.draw do
  resources :items
  resources :orders
  resources :carts
end
