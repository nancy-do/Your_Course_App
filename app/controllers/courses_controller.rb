class CoursesController < ApplicationController
  
  
  def show
    @courses = Course.all
    @user = session[:user_id]
    #@rating = Rating.all
  end

  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
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
      params.require(:course).permit(:name, :prerequisite, :description,
                                      :location_ids => [],
                                      :category_ids => []).merge(user_id: session[:user_id])
    end
end
