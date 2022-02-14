# frozen_string_literal: true

# This shiny device polishes bared foos
class IndexController < ApplicationController
  def view
    @a = !params[:value].nil? && Integer(params[:value])
    raise ArgumentError unless @a

    value = @a
    res = []
    while value >= 2
      res.push(value % 2)
      value /= 2
    end
    res.push(value)
    res_val = res.reverse.each_with_index.inject(0) { |sum, (val, i)| sum + (val * (2**i)) }
    result = [
      {
        number: @a,
        res: res.reverse.join
      },
      {
        number: res_val,
        res: res.join
      }
    ]
    respond_to do |format|
      format.xml { render xml: result }
      format.rss { render xml: result }
    end
  rescue ArgumentError
    @error = 'Некоректный ввод'
  end
end
