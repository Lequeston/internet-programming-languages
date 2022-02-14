# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ajax/result.js.erb', type: :view do
  it 'should pass result with result to JS code' do
    result = Faker::Lorem.sentence
    assign :result, result

    render

    expect(rendered).to match(result)
  end
end
