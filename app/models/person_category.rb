# frozen_string_literal: true

class PersonCategory < ApplicationRecord
  belongs_to :person
  belongs_to :category
  has_many :transactions, dependent: :destroy

  def select_title
    "Person: #{person.name}, Category: #{category.name} (#{category.transaction_type})"
  end
end
