# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :person_category
  validates :amount_value, presence: true
  validates :amount_value, numericality: { greater_than: 0.0 }
end
