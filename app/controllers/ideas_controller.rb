class IdeasController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_idea, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only:[:edit, :update, :destroy]

    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new(idea_params)
        @idea.user = current_user
        if @idea.is_valid?
            if @idea.save 
                flash[:success] = "Idea successfully created"
                redirect_to @idea
            else
                flash[:error] = "Something went wrong"
                render 'new'
            end
        else
        flash[:alert] = "Please Add Title and Body"
            redirect_to new_idea_path(@idea)
        end
    end

    def show
        @review = Review.new
    end

    def edit

    end

    def update
        if @idea.update(idea_params)
            flash[:success] = "Idea successfully updated"
            redirect_to @idea
        else
            flash[:error] = "Something went wrong"
            render :edit  
        end
    end  

    def destroy
        @idea.destroy
        redirect_to ideas_path
    end

    private

    def idea_params
        params.require(:idea).permit(:title, :body)
    end

    def find_idea
        @idea = Idea.find params[:id]
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @idea)
    end  

    
end
