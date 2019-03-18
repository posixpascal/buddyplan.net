require 'test_helper'

class Movies::Inventories::PrintControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_inventories_print_create_url
    assert_response :success
  end

end
