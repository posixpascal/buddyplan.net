require 'test_helper'

class Movies::Scenes::PrintControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_scenes_print_create_url
    assert_response :success
  end

end
