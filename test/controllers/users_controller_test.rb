require 'test_helper'
require 'authlogic/test_case'

class UsersControllerTest < ActionDispatch::IntegrationTest 
    def setup
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
    end

end
