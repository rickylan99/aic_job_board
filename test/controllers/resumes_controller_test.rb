require "test_helper"

class ResumesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resumes_index_url
    assert_response :success
  end

  test "should get create" do
    get resumes_create_url
    assert_response :success
  end

  test "should get show" do
    get resumes_show_url
    assert_response :success
  end

  test "should get edit" do
    get resumes_edit_url
    assert_response :success
  end

  test "should get delete" do
    get resumes_delete_url
    assert_response :success
  end
end
