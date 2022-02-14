# frozen_string_literal: true

class AjaxController < ApplicationController
  before_action :parse_params, only: :result

  def input; end

  def result
    @a = !val.nil? && Integer(params[:value])
    raise ArgumentError unless @a

    value = @a
    res = []
    while value >= 2
      res.push(value % 2)
      value /= 2
    end
    res.push(value)
    res_val = res.reverse.each_with_index.inject(0) { |sum, (val, i)| sum + val * 2**i }
    @result ||= "#{@a} = #{res.reverse.join}" + "\n" "#{res_val} = #{res.join}"
  rescue ArgumentError
    @result = 'Некоректный ввод'
  end

  private

  attr_reader :val

  def parse_params
    @val = params[:value]
    @result = 'Некоректный ввод' if val && val.empty?
  end
end
