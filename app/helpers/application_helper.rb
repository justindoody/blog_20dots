module ApplicationHelper
  def post_page?
    @body_class == 'post'
  end

  def body_class
    @body_class || 'all_posts'
  end
end
