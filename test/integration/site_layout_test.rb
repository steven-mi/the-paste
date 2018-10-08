require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'projects/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", sign_in_path
    assert_select "a[href=?]", help_path
      #  get help_path
      # assert_template 'static_pages/help'
  end

  test "layout components" do
    get root_path
    assert_template 'projects/index'
    assert_select "header"
    assert_select "div.navdrawer"
  end
end
