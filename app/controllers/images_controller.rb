class ImagesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @image = @post.images.build(post_params)
    if @post.save
      redirect_to edit_post_path(@post.id)
    end
  end

  private

    def post_params
      params.fetch(:image, {}).permit(:name)
    end
end
