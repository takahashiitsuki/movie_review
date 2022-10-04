require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get review" do
    get admin_users_review_url
    assert_response :success
  end
end
