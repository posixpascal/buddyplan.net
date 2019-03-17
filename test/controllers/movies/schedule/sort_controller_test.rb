require 'test_helper'

class Movies::Schedule::SortControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_schedule_sort_create_url
    assert_response :success
  end

end
