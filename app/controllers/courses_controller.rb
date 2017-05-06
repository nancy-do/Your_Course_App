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
      @course.locations << Location.find(location_params)
      @course.categories <<  Category.find(category_params)
      flash[:success] = "Course successfully created"
      redirect_to courses_path
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
      puts params[:course][:locations]
      return params[:course][:locations]
      # if (params[:course][:locations] == 0)
      #   return nil
      # else  
      #   return params[:course][:locations]
      # end
    end
    
    def category_params
      return params[:course][:categories]
      # if (params[:course][:categories] == 0)
      #   return nil 
      # else
      #   return params[:course][:categories]
      # end 
    end
end
