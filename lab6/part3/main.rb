# frozen_string_literal: true

def maxim(a_val, b_val, step, &len)
  iter = a_val
  max = block_given? ? yield(iter) : len.call(iter)
  while iter <= b_val
    current_len = block_given? ? yield(iter) : len.call(iter)
    max = current_len > max ? current_len : max
    iter += step
  end
  max
end

def maxin(a_val, b_val, step)
  maxim(a_val, b_val, step) do |x|
    ((Math.asin(x) / x) - (Math.tan(x + 1) / (x + 1))).abs
  end
end
