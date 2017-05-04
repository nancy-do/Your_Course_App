class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
   @user = User.new(user_params)
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
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
