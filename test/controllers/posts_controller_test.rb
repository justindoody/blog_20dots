require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = posts(:one)
  end

  test "should get list of posts" do
    get :index
    assert_response :success
  end

  test "post id should get post" do
    
  end
end
