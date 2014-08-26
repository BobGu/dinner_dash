class ItemsController < ApplicationController
	before_action	:set_item, only: [:show, :edit, :update, :destroy]

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

		respond_to do |format|
			if @item.save
				format.html { redirect_to admin_item_path(@item), notice: 'Item was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to admin_item_path(@item), notice: 'Item was successfully updated.'
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
																	 :price_pie
																	 )
		end
end
