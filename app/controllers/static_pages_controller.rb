class StaticPagesController < ApplicationController

  def about
    @post = Post.where({title: "about"}).first
    render :layout =>  'post'
  end

  def feed
    @posts = Post.where(draft: false)

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
