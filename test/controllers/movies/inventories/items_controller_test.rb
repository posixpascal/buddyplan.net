require 'test_helper'

class Movies::Inventories::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_inventories_items_create_url
    assert_response :success
  end

  test "should get new" do
    get movies_inventories_items_new_url
    assert_response :success
  end

end
