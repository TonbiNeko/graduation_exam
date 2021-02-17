class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ edit update ]

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
      render :new, notice: "投稿出来ませんでした"
    end
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集が完了しました"
    else
      render :edit, notice: "編集出来ませんでした"
    end
  end

private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
