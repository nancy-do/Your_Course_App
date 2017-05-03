class LocationsController < ApplicationController
  def show
    #show courses scheduled in that location
    #@locations = Location.all
  end
  
  def index
    @locations = Location.all
  end 
  
  def new
    @location = Location.new
  end 
  
  def create 
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "Location successfully created"
      redirect_to locations_path
    else
      render 'new'
    end
  end
  
  private
    def location_params
      params.require(:location).permit(:building, :level, :room)
    end

end
