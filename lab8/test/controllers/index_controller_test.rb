# frozen_string_literal: true

require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest

  test 'should return error if params are empty' do
    get index_output_url
    assert_response :success
    assert_not_nil assigns[:error]
    assert_nil assigns[:result]
  end

  test 'should return result if params are numbers' do
    get index_output_url, params: { value: '6' }
    assert_response :success
    assert_nil assigns[:error]
    assert_equal ["6 = 110", "3 = 011"], assigns[:result]
  end

  test 'should return error if has not number' do
    get index_output_url, params: { value: 'dsada' }
    assert_response :success
    assert_not_nil assigns[:error]
    assert_nil assigns[:result]
  end
end
