require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @posts = Post.all
  end

  test "There should be two posts in the test database" do
    assert_equal 2, @posts.count
  end

  test "First title should be correct" do
    assert_equal "Test Post One", posts(:one).title
  end

end
