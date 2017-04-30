class LocationsController < ApplicationController
  def show
    #show courses scheduled in that location
  end
  
  def new
    @location = Location.new
  end 
  
  def create 
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
