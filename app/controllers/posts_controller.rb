class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :delete]

    def index
        if params[:user_id]
            @posts = Post.where(user_id: params[:user_id])
            @user = current_user
        else 
            @posts = Post.all
        end
    end

    def show 
    end

    def new
        if !!params[:user_id] && params[:user_id].to_i == current_user.id
            @post = Post.new
            @post.user = current_user
        else 
            redirect_to root_path
        end
    end

    def create 
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save 
            redirect_to current_user
        else 
            render :new
        end
    end

    def edit 
        unless current_user == @post.user
            flash[:alert] = "This is not your post, you do not have permission to edit it."
            redirect_to root_path
        end
    end

    def update 
        if @post.user == current_user
            @post.update(post_params)
            if @post.save 
                redirect_to @post  
            else 
                render :edit
            end
        else 
            redirect_to root_path
        end
    end

    def delete 
    
    end


    private 

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find_by_id(params[:id])
    end
end
