class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
    render :layout =>  'post'
  end

  def new
    @post = Post.create(title: "A New Post", post: "Start typing...")
    if @post.save
      redirect_to @post
    else
      redirect_url root_url
    end
  end

  def destroy
    @post.destroy
    redirect_url root_url
  end

  def update
  end

  private

    def post_params
      params.permit(:title, :post)
    end
end
