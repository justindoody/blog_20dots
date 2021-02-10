class PostsController < ApplicationController
  before_action :confirm_admin, except: [:index, :show]
  before_action :redirect_to_admin_if_logged_in, only: :index
  before_action :load_post, only: [:destroy, :edit, :update, :publish, :unpublish]

  def index
    @posts = Post.where(draft: false).order(published_at: :desc)
  end

  def show
    @post = Post.friendly.find(params[:id])
    @updated_since_published = @post.updated_since_published?
  end

  def new
    Post.create_default
    redirect_to root_url
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  def edit
    @image = Image.new
  end

  def update
    @post.slug = nil
    if @post.update_attributes(post_params)
      respond_to do |format|
        format.html { redirect_to edit_post_path(@post.id) }
        format.js
      end
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
