# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :user
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 }
end
