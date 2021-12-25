# frozen_string_literal: true

class Note < ApplicationRecord
  has_one :money_transaction, dependent: :nullify
end
