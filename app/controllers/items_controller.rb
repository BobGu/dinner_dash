class ItemsController < ApplicationController
	before_action	:set_item, only: [:show, :edit, :update, :destroy]

	def new
		@item = Item.new
	end

	def index
		@categories = Category.all
		@items = Item.all
	end

	def show
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			@item.categories_list(params['item']['categories'])
			flash.notice = 'Item was successfully created.'
			redirect_to admin_item_path(@item)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			@item.categories_list(params['item']['categories'])
			flash.notice = 'Item was successfully updated.'
			redirect_to admin_item_path(@item)
		else
			render :edit
		end
	end

	def destroy
		if @item.destroy
			redirect_to admin_items_path, notice: 'Item was successfully deleted.'
		end
	end

	private
		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:title,
																	 :description,
																	 :price_pie,
																	 :categories_list
																	 )
		end
end
