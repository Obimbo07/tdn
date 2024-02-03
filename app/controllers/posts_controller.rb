class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @user = current_user

    if @post.save
      flash[:success] = 'Post was Successfully created'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Error: post could not be saved'
      render :new
    end
  end

  
  def destroy
    @user = current_user
    @post = current_user.posts.find_by(id: params[:id])
    @post = Post.find(params[:id])authorize! :destroy, @post
    @post.destroy redirect_to posts_path

    if @post
<<<<<<< HEAD
      @post.likes.destroy_all
      @post.comments.destroy_all
      @post.
      flash[:sudestroyccess] = 'Post was successfully deleted'
=======
      @post = Post.find(params[:id])
      authorize! :destroy, @post
      @post.destroy

      flash[:success] = 'Post was successfully deleted'
>>>>>>> dd12021e3fe38eb1fe1bbee2acb7726f5ba37020
    else
      flash[:error] = 'Error: Post could not be deleted'
    end

    redirect_to user_post_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
