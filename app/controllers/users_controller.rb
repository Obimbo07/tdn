# frozen_string_literal: true

# This controller provides common functionality for all other controllers
class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.includes(posts: %i[comments likes]).find(params[:id])
  end
end
