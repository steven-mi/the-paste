require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    :load_authlogic
    @user = users(:alice)

  end
  test "should get new" do

    get new_user_sessions_path
    assert_response :success
  end

  test "should create user session" do
    post user_sessions_path, params: {user_session: {:email => @user.email, :password => @user.password, :remember_me => "0"}}
    assert_response :success
    assert_template root_path
  end

=begin
  test "should destroy user session" do
    post user_sessions_path, params: {user_session: {:email => @user.email, :password => @user.password, :remember_me => "0"}}
    delete user_sessions_path
    assert_response :success
    assert_template root_path
  end
=end
end
