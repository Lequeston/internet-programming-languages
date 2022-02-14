# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require './main'

# This shiny device polishes bared foos
class TestCypher < Minitest::Test
  def setup
    @generated_file_name = 'test_genetared.txt'
    @input_file_name = 'test_F.txt'
    @output_file_name = 'test_G.txt'

    generate_input_file
  end

  def generate_input_file
    sentence = Faker::Lorem.sentence
    File.open(@input_file_name, 'w') { |file| file.write sentence }
    sentence
  end

  def test_func_example1
    num_sentences = 3
    generate_file(@generated_file_name, num_sentences)

    assert File.exist?(@generated_file_name)

    input = read(@generated_file_name)
    write(@output_file_name, input.clone)
    output = read(@output_file_name)
    input.each_with_index do |string, index|
      assert_equal string, output[index]
    end
  end

  def teardown
    File.delete(@generated_file_name) if File.exist?(@generated_file_name)
    File.delete(@input_file_name) if File.exist?(@input_file_name)
    File.delete(@output_file_name) if File.exist?(@output_file_name)
  end
end
