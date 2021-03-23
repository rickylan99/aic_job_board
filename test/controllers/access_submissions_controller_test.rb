# frozen_string_literal: true

require 'test_helper'

class AccessSubmissionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get access_submissions_new_url
    assert_response :success
  end

  test 'should get index' do
    get access_submissions_index_url
    assert_response :success
  end

  test 'should get show' do
    get access_submissions_show_url
    assert_response :success
  end
end
