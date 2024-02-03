module Api
    module V1
      class UsersController < ApplicationController
        def index
          users = User.all
          render json: users
        end
  
        def show
          user = User.includes(posts: [:comments, :likes]).find(params[:id])
          render json: user
        end
      end
    end
  end
  