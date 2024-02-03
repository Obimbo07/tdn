module Api
  module V1
    class PostsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        posts = user.posts.includes(:comments, :likes)
        render json: posts
      end

      def show
        user = User.find(params[:user_id])
        post = user.posts.includes(:comments, :likes).find(params[:id])
        render json: post
      end
    end
  end
end
