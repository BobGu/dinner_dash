Rails.application.routes.draw do
  root "welcome#index"

  resources :items
  resources :categories
  resources :orders do
    resources :order_items do
      get :increment, on: :member
      get :decrement, on: :member
    end
  end

  patch '/order/:id/cancel' => 'orders#cancel',   as: :cancel_order
  patch '/pay/:id/pay'      => 'orders#pay',      as: :pay_order
  patch '/pay/:id/complete' => 'orders#complete',  as: :complete_order

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  get     '/cart'             => 'carts#show',              as: :cart
  get     '/add_to_cart'      => 'carts#add_to_cart_view',  as: :add_to_cart

  get     '/cart/edit'        => 'carts#edit',              as: :edit_cart
  patch   '/cart'             => 'carts#update'
  put     '/cart'             => 'carts#update'
  post    '/cart/items'       => 'cart_items#create',       as: :cart_items
  delete  '/cart/items'       => 'cart_items#destroy',      as: :cart_items_destroy
  get     '/cart/items'       => 'cart_items#increment',    as: :cart_cart_items_increment
  get     '/cart/items'       => 'cart_items#decrement',    as: :cart_cart_items_decrement

  increment_order_order_item GET    /carts/:cart_id/cart_items/ cart_items#increment
decrement_order_order_item GET    /orders/:order_id/order_items/:id/decrement(.:format) order_items#decrement

  get     '/order_items/new'  => 'order_items#new',         as: :new_order_item
  post    '/order_items'      => 'order_items#create',      as: :order_items

  get     '/contact'          => 'contact#show',            as: :contact

  namespace :admin do
    resources :items
    resources :categories
  end
end
