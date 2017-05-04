class CoursesController < ApplicationController
  
  
  def show
    @courses = Course.all
  end

  def new
    @course = Course.new
    @locations = Location.all
    @categories = Category.all
  end
  
  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = "Course successfully created"
      redirect_to course_path
    else
      render 'new'
    end
  end
  
  
  private

    def course_params
      params.require(:course).permit(:name, :prerequisite, :description)
      # params.require(:location).permit(:id)
    end
    
    def location_params
      params.require(:course).permit(:locations)
    end
    
    def category_params
      params.require(:course).permit(:categories)
    end
end
