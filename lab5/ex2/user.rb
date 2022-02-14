# frozen_string_literal: true

require './main'

puts 'Вводите строки по одной, окончание ввода по пустой строке.'

strings = []

ARGF.each_line do |line|
  line.chomp!

  break if ARGF.lineno > 1 && line == ''

  strings << line
end

unless strings.reject { |string| /^[а-я\s]+$/ =~ string }.empty?
  puts 'Программа работает только со строками на русском языке (строчые)'
  exit 1
end

encrypted = strings.map { |string| encrypt string }

puts 'Расшифрованные строки:'

print_strings encrypted
