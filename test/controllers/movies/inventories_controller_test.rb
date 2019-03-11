require 'test_helper'

class Movies::InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get movies_inventories_edit_url
    assert_response :success
  end

  test "should get index" do
    get movies_inventories_index_url
    assert_response :success
  end

  test "should get show" do
    get movies_inventories_show_url
    assert_response :success
  end

  test "should get destroy" do
    get movies_inventories_destroy_url
    assert_response :success
  end

  test "should get update" do
    get movies_inventories_update_url
    assert_response :success
  end

  test "should get new" do
    get movies_inventories_new_url
    assert_response :success
  end

end
