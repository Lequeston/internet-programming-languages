# frozen_string_literal: true

require './main'

print('Введите переменную x: ')
x = gets.chomp.to_f
print('Введите переменную eps: ')
eps = gets.chomp.to_f

puts calculate_series(x, eps).round(7)
