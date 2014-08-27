class Admin::ItemsController < ApplicationController
	before_action	:set_item, only: [:show, :edit, :update, :destroy]
	before_action :authorize?, only: [:show, :create, :edit, :update, :destroy]

	def new
		@item = Item.new
	end

	def index
		@items = Item.all
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

	def show
	end

	private

		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:title,
																	:description,
																	:price_pie,
																	:picture
																	)
		end

		def authorize?
			redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "admin"
		end
end
