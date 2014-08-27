class Admin::ItemsController < ApplicationController
	before_action	:set_item, only: [:show, :edit, :update, :destroy]
	before_action :authorize?, only: [:show, :create, :edit, :update, :destroy]

	def new
		@item = Item.new
	end

	def index
		@items = Item.all
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
																	:price_pie
																	)
		end

		def authorize?
			redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "admin"
		end
end
