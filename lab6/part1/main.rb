# frozen_string_literal: true

class Integer
  def factorial
    (1..self).reduce(:*) || 1
  end
end

def calculate(x_val, eps)
  rounding = 6
  n = 1
  sum = 0
  loop do
    current_value = ((-1)**(n + 1) * x_val**(2 * n - 1) / (2 * n - 1).factorial).round(rounding)
    break unless current_value.abs > eps

    sum += current_value
    n += 1
  end
  sum
end
