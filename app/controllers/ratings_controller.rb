class RatingsController < ApplicationController
    
    
    def create
    end
    
    def like
        @user = session[:user_id]
        @rate_check = Rate.find_by(users_id: @user, ratings_id: params[:id])
        if (@rate_check == nil) #New rating hence not stored 
            Rating.increment_counter(:likes, params[:id])
            @rate = Rate.new(users_id: @user, ratings_id: params[:id], rated:true)
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
        @rate_check = Rate.find_by(users_id: @user, ratings_id: params[:id])
        if (@rate_check == nil) #New rating hence not stored 
            Rating.increment_counter(:dislikes, params[:id])
            @rate = Rate.new(users_id: @user, ratings_id: params[:id], rated:true)
            @rate.save
            flash[:success] = "Disliked"
            redirect_to courses_path
        else
            flash[:danger] = "You can only vote a course once"
            redirect_to courses_path
        end
    end

end
