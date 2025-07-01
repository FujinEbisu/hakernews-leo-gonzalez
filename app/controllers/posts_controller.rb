class PostsController < ApplicationController
    before_action :define_user, only: [:upvote]
    
    def index
        @posts = Post.all.order(vote: :desc)
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments.order(created_at: :desc)
    end

    def upvote
        @post = Post.find(params[:id])
        @post.upvote
    end
    
    private

    def define_user
        @user = current_user
    end
end
