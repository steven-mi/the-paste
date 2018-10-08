require 'test_helper'
require 'authlogic/test_case'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = "the-paste"
    @user = users(:alice)
  end

  test "should get new" do
    get sign_up_path
    assert_response :success
    assert_template 'users/new'
    assert_select "title", "Sign Up | #{@base_title}"
  end

  test "should create user" do
    assert_difference('User.count') do
      post "/users", params: {user: {:email => "ben@web.de", :password => "benrocks", :password_confirmation => "benrocks"}}
    end

    assert_redirected_to root_path
  end

  test "should show user" do
    get user_path(@user)
    assert_response :success
    assert_template "users/show"
  end

  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
    assert_template "users/edit"
  end

  # test "should get update" do
  #   patch user_path(@user), params:{:email => "test@web.de", :password => "benrocks"}
  #   assert_response :found
  #   assert_not_equal @user.email, "test@web.de"
  # end

end
