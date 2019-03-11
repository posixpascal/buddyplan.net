require 'test_helper'

class Movies::BudgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get movies_budgets_edit_url
    assert_response :success
  end

  test "should get index" do
    get movies_budgets_index_url
    assert_response :success
  end

  test "should get show" do
    get movies_budgets_show_url
    assert_response :success
  end

  test "should get destroy" do
    get movies_budgets_destroy_url
    assert_response :success
  end

  test "should get update" do
    get movies_budgets_update_url
    assert_response :success
  end

  test "should get new" do
    get movies_budgets_new_url
    assert_response :success
  end

end
