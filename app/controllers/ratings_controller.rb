class RatingsController < ApplicationController
    before_action :logged_in_user, only: [:like, :dislike]
    
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
    
    private
        # Confirms a logged-in user.
        def logged_in_user
            unless logged_in?
              store_location
              flash[:danger] = "Please log in to vote"
              redirect_to login_url
            end
        end
end
