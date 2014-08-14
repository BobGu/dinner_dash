class ItemsController < ApplicationController
	before_action	:set_item, only: [:show]
	
	def new
		@item = Item.new
	end

	def index
		@items = Item.all
	end

	def show
	end

	def create
		@item = Item.new(item_params)
	end

	private

	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:title, :description, :price_slice, :price_pie)
	end

end
