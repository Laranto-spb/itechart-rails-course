# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :person_category
  belongs_to :note, optional: true, dependent: :destroy

  validates :amount_value, presence: true
  validates :amount_value, numericality: { greater_than: 0.0 }
end
