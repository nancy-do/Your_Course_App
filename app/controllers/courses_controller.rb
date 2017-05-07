class CoursesController < ApplicationController
  
  
  def show
    @courses = Course.all
  end

  def new
    @course = Course.new
    @locations = Location.all
    @categories = Category.all
    @courses = Course.all
  end
  
  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = "Course successfully created"
      redirect_to courses_path
    else
      render 'new'
    end
  end
  
  
  private

    def course_params
      params.require(:course).permit(:name, :prerequisite, :description,:location_ids => [], :category_ids => [])
    end
end
