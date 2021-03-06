require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "the-paste"
  end

  test "should get root" do
    get root_path
    assert_response :success
  end

=begin
  test "should get home" do
    get home_path
    assert_response :success
    assert_template 'static_pages/home'
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_template 'static_pages/help'
    assert_select "title", "Help | #{@base_title}"
  end
=end

end
