class Transaction < ApplicationRecord
  belongs_to :person_category
  validates :amount_value, presence: true
end
