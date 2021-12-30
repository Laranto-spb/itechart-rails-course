class AddColumnToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :money_transactions, :important, :boolean
  end
end
