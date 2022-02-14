# frozen_string_literal: true

require './main'

puts 'Введите значение для Troika'
x = gets.chomp
puts Troika.new(x).calc

puts 'Введите значение для TroikaSk'
x = gets.chomp
puts TroikaSk.new(x).calc
