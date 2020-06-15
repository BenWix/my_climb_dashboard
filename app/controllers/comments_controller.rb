class CommentsController < ApplicationController

    def create
        # binding.pry
        @comment = Comment.new(comment_params)
        @comment.user = current_user 
        unless @comment.save
            flash[:alert] = "There was an error and your comment was not saved"
        end
        redirect_to @comment.post
    end

    private 

    def comment_params 
        params.require(:comment).permit(:content, :post_id)
    end
end
