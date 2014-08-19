class Admin::ItemsController < ApplicationController
	before_action	:set_item, only: [:show, :edit, :update, :destroy]

	def new
		@item = Item.new
	end

	def index
		@items = Item.all
	end

	def show
		@item
	end

	def create
		@item = Item.new(item_params)

		respond_to do |format|
			if @item.save
				format.html { redirect_to admin_item_path(item), notice: 'Item was successfully created.' }
			else
				format.html { render :new}
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @item.update(item_params)
				format.html { redirect_to admin_item_path(item), notice: 'Item was successfully updated.'}
			else
				format.html {render :edit}
			end
		end
	end

	def destroy
		@item.destroy

		if @item.update(item_params)
			format.html { redirect_to admin_items_path, notice: 'Item was successfully deleted.' }
		end
	end

	private

	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:title, :description, :price_slice, :price_pie, :category_names)
	end
end