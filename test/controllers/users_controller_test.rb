require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index　" do
    get users_index　_url
    assert_response :success
  end
end
