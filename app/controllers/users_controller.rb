class UsersController < ApplicationController
  def index
    @user = current_user
    @blogs = current_user.blogs.all
  end
  def show
    @user = current_user
  end
end
