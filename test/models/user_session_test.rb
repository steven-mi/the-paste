require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase

  test "should be valid" do
    assert User.new(email: "steven123@web.com",
                    password: "foobar")
  end
end
