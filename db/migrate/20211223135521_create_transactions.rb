class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :amount_value
      t.integer :person_category_id

      t.timestamps
    end
  end
end
