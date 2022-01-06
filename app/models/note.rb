# frozen_string_literal: true

class Note < ApplicationRecord
  has_one :money_transaction, dependent: :nullify
  validates :body, presence: true, length: { minimum: 2, maximum: 50 }
end
