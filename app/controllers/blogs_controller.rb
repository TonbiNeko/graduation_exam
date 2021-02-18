class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ edit update show destroy ]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
      5.times { @blog.blog_images.build }
    else
      @blog = Blog.new
      5.times { @blog.blog_images.build }
    end
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "素晴らしいです！またごみ拾いの記録をみんなにシェアしてくださいね！"
      else
        render :new, notice: "投稿出来ませんでした"
      end
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def edit
    if @blog.blog_images.blank?
      5.times { @blog.blog_images.build }
      @blog_images = @blog.blog_images
    elsif @blog.blog_images.count >= 1
      @blog.blog_images.build
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "編集が完了しました"
    else
      render :edit, notice: "編集出来ませんでした"
    end
  end

  def show
    @blog_images = @blog.blog_images
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿が削除されました"
  end

private
  def blog_params
    params.require(:blog).permit(
                                 :title, 
                                 :content, 
                                 :image, 
                                 :image_cache,
                                 blog_images_attributes: [:image, :image_cache],
                                )
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
