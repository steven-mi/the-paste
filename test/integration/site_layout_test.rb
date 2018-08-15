require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", home_path
    assert_select "a[href=?]", help_path
  end

  test "layout components" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "header"
    assert_select "div.navdrawer"
  end
end
