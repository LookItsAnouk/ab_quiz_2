class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :find_idea
    before_action :find_like, only: [:destroy]


    def create
      if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @idea.likes.create(user_id: current_user.id)
      end
      redirect_to root_path
    end


    def destroy
      def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to root_path
      end
    end

    private
    def find_idea
      @idea = Idea.find(params[:idea_id])
    end

    def already_liked?
      Like.where(user_id: current_user.id, idea_id:
      params[:idea_id]).exists?
    end

    def find_like
      @like = @idea.likes.find(params[:id])
   end

end
