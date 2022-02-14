# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

# This shiny device polishes bared foos
class TestCypher < Minitest::Test
  def test_func_example1
    assert_equal 9, Troika.new('3*3').calc
  end

  def test_func_example2
    assert_equal 132, Troika.new('66*2').calc
  end

  def test_func_example3
    assert_equal 9, TroikaSk.new('(3*3)').calc
  end

  def test_func_example4
    assert_equal 132, TroikaSk.new('(66*2)').calc
  end
end
