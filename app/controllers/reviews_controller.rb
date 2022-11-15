class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :find_idea

    def create
        @review = Review.new(review_params)
        @review.idea = @idea
        @review.user = current_user
        if @review.save
            flash[:success] = "Review successfully created"
            redirect_to idea_path(@idea)
        else
            flash[:alert] = "Please Add Text"
            redirect_to idea_path(@idea)
        end
    end

    def destroy
        @review = Review.find params[:id]
        if can?(:crud, @review)
            @review.destroy
            redirect_to idea_path(@idea)
            flash[:success] = "Review deleted"
        elsif can?(:crud, @idea)
            @review.destroy
            redirect_to idea_path(@idea)
            flash[:success] = "Review deleted"
        else   
            redirect_to idea_path, alert: "Not athorized to change Review!"
        end
    end

    private
    def find_idea
        @idea = Idea.find params[:idea_id]
    end
    
    def review_params
        params.require(:review).permit(:body)
    end
end
