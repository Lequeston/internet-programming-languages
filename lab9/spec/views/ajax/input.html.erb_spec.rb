# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'ajax/input.html.erb', type: :view do
  before do
    render
  end

  describe 'form' do
    it 'should be present on page' do
      expect(rendered).to have_tag('form', with: { action: ajax_result_url, method: :post })
    end

    it 'should contain input for value' do
      expect(rendered).to have_tag('form') do
        with_tag 'input', with: { name: 'value', type: 'text', required: 'required' }
      end
    end

    it 'should contain submit button' do
      expect(rendered).to have_tag('form') do
        with_tag 'input', with: { type: 'submit', value: 'Отправить' }
      end
    end
  end

  describe 'div for result' do
    it 'should be present on page' do
      expect(rendered).to have_tag('div#result')
    end
  end
end
