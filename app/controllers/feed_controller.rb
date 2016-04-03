class FeedController < ApplicationController

  def data
    @posts = Post.where(draft: false)

    respond_to do |format|
      format.atom { render layout: false }
      format.rss { redirect_to feed_path(format: :atom), status: :moved_permanently }
    end
  end
end
