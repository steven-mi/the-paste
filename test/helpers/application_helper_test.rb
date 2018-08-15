require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         'the-paste'
    assert_equal full_title("Help"), 'Help | the-paste'
  end
end
