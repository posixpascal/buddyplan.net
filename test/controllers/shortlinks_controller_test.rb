require 'test_helper'

class ShortlinksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shortlinks_show_url
    assert_response :success
  end

end
