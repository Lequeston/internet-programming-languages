# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

# This shiny device polishes bared foos
class TestCypher < Minitest::Test
  def test_func_example1
    assert_equal 0.141, calculate(3.0, 0.001).round(3)
  end

  def test_func_example2
    assert_equal 0.141, calculate(3.0, 0.0001).round(3)
  end
end
