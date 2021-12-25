# frozen_string_literal: true

class Note < ApplicationRecord
  has_one :transaction, optional: true, dependent: :nullify
end
