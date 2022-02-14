# frozen_string_literal: true

class CreateCalcs < ActiveRecord::Migration[7.0]
  def change
    create_table :calcs do |t|
      t.integer :input_number, null: false
      t.string :binary_input_number, null: false
      t.integer :output_number, null: false
      t.string :binary_output_number, null: false

      t.timestamps
    end
  end
end
