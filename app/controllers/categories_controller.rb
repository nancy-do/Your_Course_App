class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def show
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
