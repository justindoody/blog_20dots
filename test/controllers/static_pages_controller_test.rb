require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "20dots"
  end

  test "should get about page" do
    get :about
    assert_response :success
    assert_select "title", "#{@base_title} | About"
  end

end
