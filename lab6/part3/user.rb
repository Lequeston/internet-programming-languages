# frozen_string_literal: true

require './main'

print('Введите переменную a: ')
a = gets.chomp.to_f
print('Введите переменную b: ')
b = gets.chomp.to_f
print('Введите переменную step: ')
step = gets.chomp.to_f

puts maxin(a, b, step)
