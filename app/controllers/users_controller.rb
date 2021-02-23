class UsersController < ApplicationController
  def index
    @user = current_user
    @blogs = current_user.blogs.all
  end
  def show
    @user = User.find(params[:id])
  end
end
