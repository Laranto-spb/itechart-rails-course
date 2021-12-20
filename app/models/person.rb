# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :user
  has_many :person_categories
  has_many :categories, through: :person_categories, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 }

  before_create :check_uniqueness
  before_destroy :check_people_count

  private

  def check_people_count
    throw(:abort) if user.people.count <= 1
  end

  def check_uniqueness
    throw(:abort) if user.people.exists?(name: name)
  end
end
