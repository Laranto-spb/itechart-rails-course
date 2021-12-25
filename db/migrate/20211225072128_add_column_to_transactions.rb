# frozen_string_literal: true

class AddColumnToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :note_id, :integer
  end
end
