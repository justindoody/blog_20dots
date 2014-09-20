class PostsController < ApplicationController
  before_action :logged_in_user, only: [:admin, :edit, :update, :destroy]

  def index
    if logged_in?
      redirect_to admin_path
    end
    @posts = Post.where(draft: false)
  end

  def show
    @post = Post.friendly.find(params[:id])
    render :layout =>  'post'
  end

  def new
    @post = Post.create(title: "A New Post", post: "Start typing...")
    if @post.save
      redirect_to edit_post_path(@post)
    else
      redirect_to root_url
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to root_url
  end

  def edit
    @post = Post.friendly.find(params[:id])
    render :layout =>  'post'
  end

  def update
    @post = Post.friendly.find(params[:id])
    @post.slug = nil
    if @post.update_attributes(post_params)
      redirect_to edit_post_path(@post)
    end
  end

  def admin
    @posts = Post.all
  end

  def publish
    @post = Post.friendly.find(params[:id])
    @post.update_attributes(draft: false)
    redirect_to edit_post_path(@post)
  end

  def unpublish
    @post = Post.friendly.find(params[:id])
    @post.update_attributes(draft: true)
    redirect_to edit_post_path(@post)
  end

  private

    def post_params
      params.fetch(:post, {}).permit(:post, :title, :cover_photo)
    end
end
