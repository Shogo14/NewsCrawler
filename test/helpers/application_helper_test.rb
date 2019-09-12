require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "News Crawler"
    assert_equal full_title("Help"), "Help | News Crawler"
  end
end