class UsersController < ApplicationController
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
      redirect_to root_path
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
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @course = @user.courses
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
