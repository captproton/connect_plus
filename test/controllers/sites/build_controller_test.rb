require "test_helper"

class Sites::BuildControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sites_build_show_url
    assert_response :success
  end

  test "should get update" do
    get sites_build_update_url
    assert_response :success
  end
end
