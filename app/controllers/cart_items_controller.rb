class CartItemsController < ApplicationController
  def create
    # FIXME: Start here
    # BUT! ultimately pull this logic out into an object
    item = Item.find(params[:item_id])
    cart.cart_items.create item: item
    render nothing: true
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
