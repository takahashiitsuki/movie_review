require "test_helper"

class Users::ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_review_new_url
    assert_response :success
  end

  test "should get show" do
    get users_review_show_url
    assert_response :success
  end

  test "should get index" do
    get users_review_index_url
    assert_response :success
  end
end
