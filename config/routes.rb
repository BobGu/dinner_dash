Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders
  patch '/order/:id/cancel' => 'orders#cancel', as: :cancel_order
  patch '/pay/:id/pay'      => 'orders#pay',    as: :pay_order
  resources :users


  namespace :admin do
    resources :items
    resources :categories
  end

  root "welcome#index"
  get   '/cart'       => 'carts#show',        as: :cart
  get   '/add_to_cart' => 'carts#add_to_cart_view',  as: :add_to_cart

  get   '/cart/edit'  => 'carts#edit',        as: :edit_cart
  patch '/cart'       => 'carts#update'
  put   '/cart'       => 'carts#update'
  post  '/cart/items' => 'cart_items#create', as: :cart_items
  delete '/cart/items' => 'cart_items#destroy', as: :cart_items_destroy

  get  '/order_items/new' => 'order_items#new', as: :new_order_item
  post  '/order_items'    => 'order_items#create', as: :order_items

  get '/contact' => 'contact#show'
end
