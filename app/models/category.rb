# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :person_categories, dependent: :destroy
  has_many :people, through: :person_categories
  before_destroy :check_category_count

  def check_category_count
    user.people.each do |person|
      throw(:abort) if person.categories.count <= 1
    end
  end
end
