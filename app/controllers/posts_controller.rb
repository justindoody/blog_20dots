class PostsController < ApplicationController
  before_action :confirm_admin, except: [:index, :show]
  before_action :load_post, only: [:destroy, :edit, :update, :publish, :unpublish]

  def index
    redirect_to admin_path if logged_in?
    @posts = Post.where(draft: false).order(published_at: :desc)
  end

  def show
    @post = Post.friendly.find(params[:id])
    @updated_since_published = @post.updated_since_published?
    render layout: 'post'
  end

  def new
    @post = Post.create_default
    redirect_to root_url
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  def edit
    @image = Image.new
    render layout: 'post'
  end

  def update
    @post.slug = nil
    if @post.update_attributes(post_params)
      redirect_to edit_post_path(@post.id)
    end
  end

  def admin
    @posts = Post.all.order(created_at: :desc)
  end

  def publish
    @post.publish
    redirect_to edit_post_path(@post.id)
  end

  def unpublish
    @post.unpublish
    redirect_to edit_post_path(@post.id)
  end

  private

    def post_params
      params.fetch(:post, {}).permit(:post, :title, :cover_photo, :post_images)
    end

    def load_post
      @post = Post.find params[:id]
    end
end
