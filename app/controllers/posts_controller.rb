class PostsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]

  def index
    redirect_to admin_path if logged_in?
    @posts = Post.where(draft: false).order(published_at: :desc)
  end

  def show
    @post = Post.friendly.find(params[:id])
    @updated_since_published = @post.updated_since_published
    render layout: 'post'
  end

  def new
    @post = Post.create_default
    redirect_to root_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end

  def edit
    @post = Post.find(params[:id])
    @image = Image.new
    render layout: 'post'
  end

  def update
    @post = Post.find(params[:id])
    @post.slug = nil
    if @post.update_attributes(post_params)
      redirect_to edit_post_path(@post.id)
    end
  end

  def admin
    @posts = Post.all.order(created_at: :desc)
  end

  def publish
    @post = Post.find(params[:id])
    @post.publish
    redirect_to edit_post_path(@post.id)
  end

  def unpublish
    @post = Post.find(params[:id])
    @post.unpublish
    redirect_to edit_post_path(@post.id)
  end

  private

    def post_params
      params.fetch(:post, {}).permit(:post, :title, :cover_photo, :post_images)
    end
end
