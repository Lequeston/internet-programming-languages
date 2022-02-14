# frozen_string_literal: true

ALPHABET = ('0'..'9').freeze
ALPHABET_OPERATOR = ['+', '-', '/', '*'].freeze
ALPHABET_IGNORE = ['(', ')'].freeze
ALPHABET_CODES = ALPHABET.to_a.join.unpack('U*')
ALPHABET_OPERATOR_CODES = ALPHABET_OPERATOR.to_a.join.unpack('U*')
ALPHABET_IGNORE_CODES = ALPHABET_IGNORE.to_a.join.unpack('U*')

# This class Troika :)
class Troika
  def initialize(str)
    @str = str
    @stack = []
  end

  def parser
    elem = []

    @str
      .unpack('U*')
      .each do |char_code|
        if ALPHABET_CODES.include?(char_code)
          elem.push(char_code)
        elsif ALPHABET_OPERATOR_CODES.include?(char_code)
          @operator = char_code.chr
          @stack.push(elem.pack('U*'))
          elem = []
        end
      end
    @stack.push(elem.pack('U*'))
  end

  def calc
    parser
    case @operator
    when ALPHABET_OPERATOR[0]
      @res = @stack[0].to_i + @stack[1].to_i
    when ALPHABET_OPERATOR[1]
      @res = @stack[0].to_i - @stack[1].to_i
    when ALPHABET_OPERATOR[2]
      @res = @stack[0].to_i / @stack[1].to_i
    when ALPHABET_OPERATOR[3]
      @res = @stack[0].to_i * @stack[1].to_i
    end
    @res
  end
end

# This class TroikaSk :)
class TroikaSk < Troika
  def parser
    elem = []

    @str
      .unpack('U*')
      .each do |char_code|
        unless ALPHABET_IGNORE_CODES.include?(char_code)
          if ALPHABET_CODES.include?(char_code)
            elem.push(char_code)
          elsif ALPHABET_OPERATOR_CODES.include?(char_code)
            @operator = char_code.chr
            @stack.push(elem.pack('U*'))
            elem = []
          end
        end
      end
    @stack.push(elem.pack('U*'))
  end
end
