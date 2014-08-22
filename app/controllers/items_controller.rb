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
				format.html { redirect_to @item, notice: 'Item was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @item.update(item_params)
				format.html { redirect_to admin_item_path(@item), notice: 'Item was successfully updated.'}
			else
				format.html {render :edit}
			end
		end
	end

	def destroy
		@item.destroy

		redirect_to items_path
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
