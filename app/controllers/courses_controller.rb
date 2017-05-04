class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def show
    @courses = Course.all
  end

  def edit
  end

  def destroy
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
    end
end
