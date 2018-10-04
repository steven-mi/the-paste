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
    post user_sessions_path, params: {user_sessions: {:email => "test@test", :password => "test123", :remember_me => "0"}}
    assert UserSession.find
  end

  test "should destroy user session" do

    delete user_sessions_path

    assert_nil UserSession.find
  end
end
