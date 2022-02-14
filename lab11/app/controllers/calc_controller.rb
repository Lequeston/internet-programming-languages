# frozen_string_literal: true

# calc
class CalcController < ApplicationController
  def index; end

  def all
    respond_to do |format|
      format.xml { render xml: Calc.all.to_xml }
      format.html { @calcs = Calc.order(clicks: :desc).page params[:page] }
    end
  end

  def result
    if params[:value] && Integer(params[:value])
      @calc = Calc.find_by(input_number: Integer(params[:value]))
      @calc = Calc.add_number_bd(Integer(params[:value])) if @calc.nil?
      redirect_to calc_show_url(id: @calc.id)
    else
      @error = :no_url_provided
    end
  end

  def show
    id = Integer(params[:id])
    if id && Calc.find_by(id: id)
      @calc = Calc.find(id)
    else
      @error = :no_url_provided
    end
  end
end
