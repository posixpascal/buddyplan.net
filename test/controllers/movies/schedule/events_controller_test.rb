require 'test_helper'

class Movies::Schedule::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_schedule_events_create_url
    assert_response :success
  end

end
