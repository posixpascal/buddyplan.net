require 'test_helper'

class Movies::AccessManager::InvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movies_access_manager_invites_new_url
    assert_response :success
  end

  test "should get create" do
    get movies_access_manager_invites_create_url
    assert_response :success
  end

end
