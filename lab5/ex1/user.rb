# frozen_string_literal: true

require './main'

print('Введите переменную x: ')
x = gets.chomp.to_f
print('Введите переменную z: ')
z = gets.chomp.to_f

puts func(x, z)
