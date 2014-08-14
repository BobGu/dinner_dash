Rails.application.routes.draw do
  resources :items
  resources :orders

  get   '/cart'       => 'carts#show',        as: :cart
  get   '/cart/edit'  => 'carts#edit',        as: :edit_cart
  patch '/cart'       => 'carts#update'
  put   '/cart'       => 'carts#update'
  post  '/cart/items' => 'cart_items#create', as: :cart_items
end
