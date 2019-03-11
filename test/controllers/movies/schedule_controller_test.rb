require 'test_helper'

class Movies::ScheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get movies_schedule_edit_url
    assert_response :success
  end

  test "should get index" do
    get movies_schedule_index_url
    assert_response :success
  end

  test "should get show" do
    get movies_schedule_show_url
    assert_response :success
  end

  test "should get destroy" do
    get movies_schedule_destroy_url
    assert_response :success
  end

  test "should get update" do
    get movies_schedule_update_url
    assert_response :success
  end

  test "should get new" do
    get movies_schedule_new_url
    assert_response :success
  end

end
