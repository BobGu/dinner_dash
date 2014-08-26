class CartItemsController < ApplicationController
  def create
    # FIXME: Start here
    # BUT! ultimately pull this logic out into an object
    item = Item.find(params[:item_id])
    cart.cart_items.create item: item
    render nothing: true
  end

  def increment
    cart_item = CartItem.find(params[:id])
    @cart     = Cart.find(params[:cart_id])
    @cart.items << cart_item.item
    redirect_to cart_path(@cart)
  end

  def decrement
  	@cart     = Cart.find(params[:cart_id])
  	cart_item = @cart.cart_items.find(params[:id])
  	cart_item.delete if cart_item
  	redirect_to cart_path(@cart)
  end

  def destroy
    item = cart.cart_items.find_by(item_id: params[:item_id])
    cart.cart_items.destroy(item)

    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
