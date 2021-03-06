class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  
  def index
    @categories = Category.all
  end 

  def show
    @category = Category.find(params[:id])
    @courses = @category.courses
    @users = Array.new
    @courses.each do |course|
      @users << User.find(course.user_id)
    end
    @users = @users.uniq
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
