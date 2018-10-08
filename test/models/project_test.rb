require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should be valid" do
    assert Project.new(title: "test",
                    password: "foobar")
  end
end
