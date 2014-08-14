class CartItemsController < ApplicationController
  def create
    # FIXME: Start here
    # BUT! ultimately pull this logic out into an object
    item = Item.find(params[:item_id])
    cart.cart_items.create item: item
    render nothing: true
  end
end
