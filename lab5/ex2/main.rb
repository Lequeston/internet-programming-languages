# frozen_string_literal: true

ALPHABET = ('а'..'я').freeze
ALPHABET_CODES = ALPHABET.to_a.join.unpack('U*')
ALPHABET_SIZE = ALPHABET.to_a.size
BASE_SHIFT = 'а'.unpack1('U')
SHIFT = 1

def print_strings(strings)
  strings.each do |string|
    puts string
  end
end

def apply_string(string, &operation)
  string
    .unpack('U*')
    .map { |char_code| ALPHABET_CODES.include?(char_code) ? (char_code - BASE_SHIFT).abs : -char_code }
    .map { |char_code| char_code >= 0 ? operation.call(char_code) % ALPHABET_SIZE : char_code }
    .map { |char_code| char_code >= 0 ? char_code + BASE_SHIFT : -char_code }
    .pack('U*')
end

def encrypt(string)
  apply_string(string) { |char_code| char_code + SHIFT }
end
