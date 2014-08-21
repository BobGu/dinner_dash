class CartsController < ApplicationController
	def show
		@cart = cart
	end

	def update
	end

  def edit
  	@item = item
  	Cart.create(@item.id, @item.title, @item.description, @item.price_slice, @item.price_pie)
  end


	def add_to_cart_view
		item = Item.find(params[:item_id])
		cart.items << item
		redirect_to items_path
	end


end
