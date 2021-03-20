require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get static_page_about_url
    assert_response :success
  end

  test "should get resources" do
    get static_page_resources_url
    assert_response :success
  end
end
