class UsersController < ApplicationController
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
