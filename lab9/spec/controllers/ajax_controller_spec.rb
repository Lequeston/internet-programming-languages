# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe 'GET #input' do
    it 'returns http success' do
      get :input
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #result' do
    it 'returns error on empty string' do
      post :result, params: { format: :js, value: '' }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:result)
      expect(assigns[:result]).to eq('Некоректный ввод')
    end

    it 'return 6 = 110\n3 = 011 if input 6' do
      value = '6'

      post :result, params: { format: :js, value: value }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:result)
      expect(assigns[:result]).to eq("6 = 110\n3 = 011")
    end
  end
end
