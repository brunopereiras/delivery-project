require 'test_helper'

class UserSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_session_new_url
    assert_response :success
  end

  test "should get login" do
    get user_session_login_url
    assert_response :success
  end

  test "should get logout" do
    get user_session_logout_url
    assert_response :success
  end

end
