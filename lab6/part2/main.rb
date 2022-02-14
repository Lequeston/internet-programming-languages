# frozen_string_literal: true

class Integer
  def factorial
    (1..self).reduce(:*) || 1
  end
end

def series(x_val)
  Enumerator.new do |y|
    rounding = 6
    n = 1
    loop do
      y << ((-1)**(n + 1) * x_val**(2 * n - 1) / (2 * n - 1).factorial).round(rounding)
      n += 1
    end
  end
end

def calculate_series(x_val, eps)
  series(x_val).take_while { |val| val.abs >= eps }.sum
end
