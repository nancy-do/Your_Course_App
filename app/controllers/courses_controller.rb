class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @courses = Course.all
    @users = User.all
  end 
  
  def show
    @course = Course.find(params[:id])
  end
  
  def destroy
    @course_id = params[:id]
    Course.find(@course_id).destroy
    
    flash[:success] = "Course deleted"
    redirect_to courses_path
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
      @rating = Rating.new(likes:0, dislikes:0, course_id: @course.id)
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
    
    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
    end

    # Confirms the correct user.
    def correct_user
        @course = Course.find(params[:id])
        @user = @course.users
        unless current_user == @user
          redirect_to(root_url) 
          flash[:danger] = "You are not the authorised user"
        end
    end
end
