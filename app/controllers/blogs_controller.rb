class BlogsController < ApplicationController
  #before_action :set_blog, only: [:]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "新しく投稿しました"
    else
      render :new
    end
  end

private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end
end
