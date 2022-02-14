# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

# This shiny device polishes bared foos
class TestCypher < Minitest::Test
  def test_func_example
    assert_equal 5.52, func(1, 6).round(2)
  end
end
