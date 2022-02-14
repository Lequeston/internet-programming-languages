# frozen_string_literal: true

require 'application_system_test_case'

class CalcsTest < ApplicationSystemTestCase
  setup do
    @calc = calcs(:one)
  end

  test 'visiting the index' do
    visit calcs_url
    assert_selector 'h1', text: 'Calcs'
  end

  test 'should create calc' do
    visit calcs_url
    click_on 'New calc'

    fill_in 'Binary input number', with: @calc.binary_input_number
    fill_in 'Binary output number', with: @calc.binary_output_number
    fill_in 'Input number', with: @calc.input_number
    fill_in 'Output number', with: @calc.output_number
    click_on 'Create Calc'

    assert_text 'Calc was successfully created'
    click_on 'Back'
  end

  test 'should update Calc' do
    visit calc_url(@calc)
    click_on 'Edit this calc', match: :first

    fill_in 'Binary input number', with: @calc.binary_input_number
    fill_in 'Binary output number', with: @calc.binary_output_number
    fill_in 'Input number', with: @calc.input_number
    fill_in 'Output number', with: @calc.output_number
    click_on 'Update Calc'

    assert_text 'Calc was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Calc' do
    visit calc_url(@calc)
    click_on 'Destroy this calc', match: :first

    assert_text 'Calc was successfully destroyed'
  end
end
