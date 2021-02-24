class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    respond_to do |format|
      @post = Post.find(params[:post_id])
      @image = @post.images.build({ name: post_params })
      if @post.save
        format.html { redirect_to edit_post_path(@post.id) }
        format.json {
          render json: {
            url: @image.name.url
          }
        }
      end
    end
  end

  private

    def post_params
      params.require(:image)
    end
end
