class Admin::CategoriesController < ApplicationController
	before_action :set_category, only: [:show]
	
	def new
		@category = Category.new
	end

	def index
		@category = Category.all
	end

	def show
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:name)
	end
end