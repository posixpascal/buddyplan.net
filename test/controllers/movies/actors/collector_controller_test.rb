require 'test_helper'

class Movies::Actors::CollectorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get movies_actors_collector_show_url
    assert_response :success
  end

  test "should get create" do
    get movies_actors_collector_create_url
    assert_response :success
  end

end
