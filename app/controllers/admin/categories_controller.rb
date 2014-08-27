class Admin::CategoriesController < ApplicationController
	before_action	:set_category, 	only: [:show, :edit, :update, :destroy]
	before_action :authorize?, 		only: [:show, :create, :edit, :update, :destroy]

	def new
		@category = Category.new
	end

	def index
		@category = Category.all
	end

	def show
	end

	def edit
	end

	def create
		@category = Category.new(category_params)

		respond_to do |format|
			if @category.save
				format.html { redirect_to admin_category_path(category), notice: 'Category was succesfully created.'}
			else
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
			if @category.update(category_params)
				format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'}
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@category.destroy

		redirect_to admin_categories_path
	end

	private

		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end

		def authorize?
			redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "admin"
		end
end
