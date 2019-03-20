require 'test_helper'

class Movies::Schedule::ListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movies_schedule_list_index_url
    assert_response :success
  end

end
