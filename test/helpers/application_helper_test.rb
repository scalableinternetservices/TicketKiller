require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "full title helper" do
    assert_equal full_title('Sign up'),         "Sign up | #{@base_title}"
  end
end