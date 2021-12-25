class RenameTransactionsTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :money_transactions
  end
end
