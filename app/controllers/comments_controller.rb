<<<<<<< HEAD
=======
# frozen_string_literal: true

# This controller provides common functionality for all other controllers
>>>>>>> dcecf69b30970763751a1e57ac85f15bdcac83e5
class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment
      @comment.destroy
    else
      flash[:notice] = 'Comment not found'
    end

    redirect_to user_post_path(@post.author)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
