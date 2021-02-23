class UsersController < ApplicationController
  def user_blogs
    @user = User.find(params[:id])
    @blogs = @user.blogs.all
  end
  def show
    @user = User.find(params[:id])
  end
end
