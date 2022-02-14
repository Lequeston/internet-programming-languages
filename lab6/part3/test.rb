# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

# This shiny device polishes bared foos
class TestCypher < Minitest::Test
  def test_func_example
    assert_equal 798.7866, maxin(0.5, 1, 0.01).round(4)
  end
end
