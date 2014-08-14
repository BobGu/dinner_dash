class CartsController < ApplicationController
	def new
		@cart = Cart.new
	end

	def index
		@cart = Cart.last
	end

	def show
		@cart = Cart.item
	end

	def create
		@cart = Cart.new
	end

	def update
	  
	end

  def edit
  	binding.pry
  	@item = item
  	Cart.create(@item.id, @item.title, @item.description, @item.price_slice, @item.price_pie)
  end

	def destroy
	end

end