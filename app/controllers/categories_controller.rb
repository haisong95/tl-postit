class CategoriesController < ApplicationController
	def new
      @category = Category.new
	end

	def show
	  @category = Category.find(params[:id])
	end

	def create
	  @category = Category.new(category_params)
	  if @category.save
	  	 flash[:notice] = "A new Category was created"
	  	 redirect_to root_path
	  else
	  	render :new
	  end
	end

	def index
		@category = Category.all
	end

	def category_params
      params.require(:category).permit(:name)
    end

end

