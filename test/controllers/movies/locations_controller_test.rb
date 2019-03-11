require 'test_helper'

class Movies::LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get movies_locations_edit_url
    assert_response :success
  end

  test "should get index" do
    get movies_locations_index_url
    assert_response :success
  end

  test "should get show" do
    get movies_locations_show_url
    assert_response :success
  end

  test "should get destroy" do
    get movies_locations_destroy_url
    assert_response :success
  end

  test "should get update" do
    get movies_locations_update_url
    assert_response :success
  end

  test "should get new" do
    get movies_locations_new_url
    assert_response :success
  end

end
