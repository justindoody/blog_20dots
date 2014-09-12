require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "sidebar links" do
    get root_path
    assert_template 'posts/index'
    assert_select "a[href=#{about_path}]"
    assert_select "a[href=#{posts_path}]"
    assert_select 'div#all_posts'
  end
end
