class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :newpass]

    def new
        @user = User.new
    end
        
    def create
        @user = User.new user_params
        if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged In!"
        else
        render :new
        end
    end

    private
        
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
        )
    end

end
