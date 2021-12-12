# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :user
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 }

  before_destroy :check_people_count
  before_create :check_uniqueness

  private

  def check_people_count
    if user.people.count <=1
      throw(:abort) 
    end
  end

  def check_uniqueness
    throw(:abort) if user.people.where(name: name).exists?
  end
end
