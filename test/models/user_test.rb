require 'test_helper'

class UserTest < ActiveSupport::TestCase


  test "should be valid" do
    assert User.new(email: "steven123@web.com",
                    password: "foobar", password_confirmation: "foobar")
  end
end
