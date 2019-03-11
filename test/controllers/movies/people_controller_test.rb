require 'test_helper'

class Movies::PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get movies_people_edit_url
    assert_response :success
  end

  test "should get index" do
    get movies_people_index_url
    assert_response :success
  end

  test "should get show" do
    get movies_people_show_url
    assert_response :success
  end

  test "should get destroy" do
    get movies_people_destroy_url
    assert_response :success
  end

  test "should get update" do
    get movies_people_update_url
    assert_response :success
  end

  test "should get new" do
    get movies_people_new_url
    assert_response :success
  end

end
