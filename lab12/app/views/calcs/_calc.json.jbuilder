# frozen_string_literal: true

json.extract! calc, :id, :input_number, :binary_input_number, :output_number, :binary_output_number, :created_at,
              :updated_at
json.url calc_url(calc, format: :json)
