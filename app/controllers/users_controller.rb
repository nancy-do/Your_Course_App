class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
   @user = User.new(user_params)
   @submit = "Register"
   @method = signup_path
    if @user.save
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
    @users = User.all
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
    
end
