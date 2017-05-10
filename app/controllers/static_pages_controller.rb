class StaticPagesController < ApplicationController
  def home
    @users = User.all
  end
  
  
  def show 
  end

end
