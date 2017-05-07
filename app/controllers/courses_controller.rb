class CoursesController < ApplicationController
  
  
  def show
    @courses = Course.all
  end

  def new
    @course = Course.new
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
      params.require(:course).permit(:name, :prerequisite, :description,:location_ids => [], :category_ids => [])
    end
end
