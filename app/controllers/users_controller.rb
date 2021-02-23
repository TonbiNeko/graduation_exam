class UsersController < ApplicationController
  def user_blogs
    @user = User.find(params[:id])
    @blogs = @user.blogs.sort_desc.page(params[:page]).per(8)
  end
  def show
    @user = User.find(params[:id])
  end
end
