class CartsController < ApplicationController
	def show
		@cart = cart
	end

	def update
	end

  def edit
  	binding.pry
  	@item = item
  	Cart.create(@item.id, @item.title, @item.description, @item.price_slice, @item.price_pie)
  end
end
