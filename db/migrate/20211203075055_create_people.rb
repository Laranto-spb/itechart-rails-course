# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
