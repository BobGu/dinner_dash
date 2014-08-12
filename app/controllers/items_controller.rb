class ItemsController < ApplicationController
	def new
		@item = Item.new
	end

	def index
		@items = Item.all
	end

	def create
		@item = Item.new(item_params)
	end

	private
	def item_params
		params.require(:item).permit(:title, :description, :price_slice, :price_pie)
	end

end
