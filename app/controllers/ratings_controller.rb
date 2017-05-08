class RatingsController < ApplicationController
    
    
    def create
    end
    
    def like
        Rating.increment_counter(:likes, params[:id])
        flash[:success] = "Liked"
        redirect_to courses_path
    end
      
    def dislike
        Rating.increment_counter(:dislikes, params[:id])
        flash[:success] = "disliked"
        redirect_to courses_path
    end

end
