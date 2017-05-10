class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
    @users = User.all
  end 
  
  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    @submit = "Create a new course"
  end
  
  def create
    @course = Course.new(course_params)
    @submit = "Create a new course"
    if @course.save
      #Once a course is created a rating tabls is created as well 
      @rating = Rating.new(likes:0, dislikes:0, courses_id: @course.id)
      @rating.save
      flash[:success] = "Course successfully created"
      redirect_to courses_path
    else
      render 'new'
    end
  end
  
  def edit
    @course = Course.find(params[:id])
    @submit = "Update course"
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course updated"
      redirect_to courses_path
    else
      render 'edit'
    end
  end
  
  
  private

    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :remove_image, :image,
                                      :location_ids => [],
                                      :category_ids => []).merge(user_id: session[:user_id])
    end
end
