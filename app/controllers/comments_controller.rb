class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        if comment_params[:comment].empty?
            flash[:alert] = "Comment cannot be empty"
        else
            @comment = Comment.new(comment_params)
            @comment.user = current_user
            @comment.post = @post
            @comment.save
            redirect_to post_path(@post)
        end

    end

    private

    def comment_params
        params.require(:comment).permit(:comment)
    end
end