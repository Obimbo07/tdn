class PostsController < ApplicationController
  load_and_authorize_resource

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

    if @post
      @post = Post.find(params[:id])
      authorize! :destroy, @post
      @post.destroy
      flash[:success] = 'Post was successfully deleted'
    else
      flash[:error] = 'Error: Post could not be deleted'
    end

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
