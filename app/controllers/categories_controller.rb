class CategoriesController < ApplicationController
	before_action :require_user, only:[:new,:create]
	before_action :set_category, only:[:edit, :update]
	before_action :require_admin, only:[:edit, :update]
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

	def edit
	end

	def update
		if @category.update(category_params)
      flash[:notice] = "The category was updated"
      redirect_to root_path
    else
      render :back
    end   
	end

	def index
		@category = Category.all
	end

	def category_params
      params.require(:category).permit(:name)
  end


  def set_category
    @category = Category.find(params[:id])
  end



end

