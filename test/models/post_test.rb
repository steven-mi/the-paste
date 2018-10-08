require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should be valid" do
    assert Post.new(title: "testtest", body: "testtesttest", syntax: "html")
  end
end
