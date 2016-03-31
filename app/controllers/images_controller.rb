class ImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    respond_to do |format|
      @post = Post.find(params[:post_id])
      @image = @post.images.build(post_params)
      if @post.save
        format.html { redirect_to edit_post_path(@post.id) }
        format.js
      end
    end
  end

  private

    def post_params
      params.fetch(:image, {}).permit(:name)
    end
end
