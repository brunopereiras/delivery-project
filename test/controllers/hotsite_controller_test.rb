require 'test_helper'

class HotsiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hotsite_index_url
    assert_response :success
  end

  test "should get about" do
    get hotsite_about_url
    assert_response :success
  end

end
