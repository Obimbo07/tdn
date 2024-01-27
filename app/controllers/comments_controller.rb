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

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  # def store_referer
  #   session[:referer] = request.referer
  # end

  # def redirect_back_or_default(default)
  #   redirect_to(session[:referer] || default)
  #   session.delete(:referer)
  # end
end
