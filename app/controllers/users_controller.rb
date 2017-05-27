class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def destroy
    User.find(params[:id]).destroy
    decrement_ratings                             #Decrementing counter for course ratings
    flash[:success] = "User Deleted"
    redirect_to root_path
  end
  
  def create
   @user = User.new(user_params)
   @submit = "Register"
   @method = signup_path
    if @user.save
      if @user.name == 'admin'
        @user.admin = true
        @user.save
      end 
      log_in @user
      flash[:success] = "Your account has been successfully regeistered" 
      
      # Go to home page when logged in
      # This is just for temporary
      # We might direct user's to other page
      redirect_back_or @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @submit = "Update Profile Information"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @course = @user.courses
  end
  
  def index
    @users = User.where.not(admin: true) 
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
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
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user == @user
    end
    
    def decrement_ratings
      rates_made_by_user = Rate.where(user_id: params[:id])
      rates_made_by_user.each do |rate|
        @rating_id = rate.rating_id
        if rate.pressed == 1
          Rating.decrement_counter(:likes, @rating_id)
        elsif rate.pressed == 0
          Rating.decrement_counter(:dislikes, @rating_id)
        end 
        Rate.find(rate.id).destroy
      end 
    end 
    
end
