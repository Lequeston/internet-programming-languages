# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AjaxController, type: :routing do
  describe 'routing' do
    it 'routes to index' do
      expect(get('/')).to route_to('ajax#input')
    end

    it 'routes to result calculations' do
      expect(post('ajax/result')).to route_to('ajax#result')
    end
  end
end
