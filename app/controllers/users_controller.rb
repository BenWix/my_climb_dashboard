class UsersController < ApplicationController
    def show 
        @user = current_user
        @posts = @user.posts.all
    end

    def edit 
        @user =current_user
    end

    def update 
        @user = current_user
        @user.update(user_params)
        if @user.save
            redirect_to @user 
        else 
            render :edit
        end
    end

    private 
    def user_params 
        params.require(:user).permit(:name, :bio, :admin)
    end


end
