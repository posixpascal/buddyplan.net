require 'test_helper'

class Movies::Actors::ImporterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movies_actors_importer_index_url
    assert_response :success
  end

end
