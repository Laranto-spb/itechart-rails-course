class RenameColumnCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :type, :transaction_type
  end
end
