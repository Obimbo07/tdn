<<<<<<< HEAD
=======
# frozen_string_literal: true

# This controller provides common functionality for all other controllers
>>>>>>> dcecf69b30970763751a1e57ac85f15bdcac83e5
class LikesController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]

  def new
    @like = Like.new
  end

  def create
    @post = @user.posts.find(params[:post_id])

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
