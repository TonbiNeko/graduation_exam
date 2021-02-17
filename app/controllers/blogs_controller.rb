class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ edit update show destroy ]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "素晴らしいです！またごみ拾い記録をみんなにシェアしてくださいね！"
      else
        render :new, notice: "投稿出来ませんでした"
      end
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集が完了しました"
    else
      render :edit, notice: "編集出来ませんでした"
    end
  end

  def show; end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿が削除されました"
  end

private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
