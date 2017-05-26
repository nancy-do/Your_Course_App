class RatingsController < ApplicationController
    
    
    def create
    end
    
    def reset
        #Resetting ratings 
        @rating = Rating.find_by(id: params[:id])
        @rating.likes = 0
        @rating.dislikes = 0
        @rating.save
        
        rated_data = Rate.where(rating_id: params[:id])
        rated_data.each do |rate|
            Rate.find(rate.id).destroy
        end 
        
        flash[:success] = "Ratings reset"
        redirect_to root_path
    end
    
    def like
        @user = session[:user_id]
        @rate_check = Rate.find_by(user_id: @user, rating_id: params[:id])
        if (@rate_check == nil) #New rating hence not stored 
            Rating.increment_counter(:likes, params[:id])
            @rate = Rate.new(user_id: @user, rating_id: params[:id], rated:true, pressed: 1)
            @rate.save
            flash[:success] = "Liked"
            redirect_to courses_path
        else
            flash[:danger] = "You can only vote a course once"
            redirect_to courses_path
        end 
    end
      
    def dislike
        @user = session[:user_id]
        @rate_check = Rate.find_by(user_id: @user, rating_id: params[:id])
        if (@rate_check == nil) #New rating hence not stored 
            Rating.increment_counter(:dislikes, params[:id])
            @rate = Rate.new(user_id: @user, rating_id: params[:id], rated:true, pressed: 0)
            @rate.save
            flash[:success] = "Disliked"
            redirect_to courses_path
        else
            flash[:danger] = "You can only vote a course once"
            redirect_to courses_path
        end
    end

end
