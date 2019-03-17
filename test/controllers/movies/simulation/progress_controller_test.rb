require 'test_helper'

class Movies::Simulation::ProgressControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get movies_simulation_progress_show_url
    assert_response :success
  end

end
