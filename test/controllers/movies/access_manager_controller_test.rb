require 'test_helper'

class Movies::AccessManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get movies_access_manager_show_url
    assert_response :success
  end

end
