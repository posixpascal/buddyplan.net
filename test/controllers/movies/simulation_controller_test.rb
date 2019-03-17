require 'test_helper'

class Movies::SimulationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_simulation_create_url
    assert_response :success
  end

  test "should get show" do
    get movies_simulation_show_url
    assert_response :success
  end

end
