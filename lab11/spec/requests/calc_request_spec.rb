# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Calcs', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /calc/result' do
    it 'check add and url' do
      post calc_result_url(value: 6)
      expect(Calc.find_by(input_number: 6)).not_to be_nil
    end

    it 'returns http success' do
      post calc_result_url
      expect(response).to have_http_status(:success)
    end
  end
end
