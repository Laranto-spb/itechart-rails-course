# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :person_categories, dependent: :destroy
  has_many :people, through: :person_categories
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }

  scope :credit_cats, ->(categories) { where(id: categories, transaction_type: 'Credit') }
  scope :debit_cats, ->(categories) { where(id: categories, transaction_type: 'Debit') }

  def destroy
    people.each do |person|
      return false if person.categories.count == 1
    end
    super
  end

  def create
    return false if people.count.zero?

    super
  end
end
