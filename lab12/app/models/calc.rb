# frozen_string_literal: true

class Calc < ApplicationRecord
  belongs_to :user

  validates :input_number, presence: true, uniqueness: true
  validates :binary_input_number, presence: true
  validates :output_number, presence: true
  validates :binary_output_number, presence: true

  # Это просто идиоматичный способ создать статический метод
  class << self
    def add_number_bd(number, user_id)
      value = number
      res = []
      while value >= 2
        res.push(value % 2)
        value /= 2
      end
      res.push(value)
      res_val = res.reverse.each_with_index.inject(0) { |sum, (val, i)| sum + (val * (2**i)) }
      create input_number: number, binary_input_number: res.reverse.join, output_number: res_val,
             binary_output_number: res.join, user_id: user_id
    end
  end
end
