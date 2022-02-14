# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

# This shiny device polishes bared foos
class TestCypher < Minitest::Test
  def test_encrypts
    string, expected = string_pair
    assert_equal expected, encrypt(string)
  end

  def test_encrypts_example
    assert_equal 'абвг', encrypt('яабв')
  end

  ALPHABET = ('а'..'я').to_a

  def word(num_letters = 6)
    ALPHABET.sample num_letters
  end

  def sentence(num_words = 4)
    num_words.times.map { word }.join
  end

  def string_pair
    string, encrypted = sentence
                        .unpack('U*')
                        .map { |char| [char, BASE_SHIFT + (char - BASE_SHIFT + SHIFT) % ALPHABET_SIZE] }
                        .transpose
    [string.pack('U*'), encrypted.pack('U*')]
  end
end
