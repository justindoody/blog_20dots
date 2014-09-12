require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  test "should get list of posts" do
    get :index
    assert_response :success
  end
end
