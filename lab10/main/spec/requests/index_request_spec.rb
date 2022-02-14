# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Indices', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get root_url(format: 'xml', value: 4)
      expect(response).to have_http_status(:success)
    end
  end

  it 'should respond with RSS' do
    get root_url(format: 'xml', value: 6)
    expect(response.content_type).to include('xml')
  end
end
