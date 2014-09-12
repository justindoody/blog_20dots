class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
    render :layout =>  'post'
  end

  def create
  end

  def destroy
    @post.destroy
    redirect_url root_url
  end

  def update
  end
end
