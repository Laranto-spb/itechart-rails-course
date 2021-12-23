# frozen_string_literal: true

class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable

  has_many :people, dependent: :destroy

  after_create :create_person

  private

  def create_person
    person = Person.create(name: 'Me', user_id: id)
    category = Category.create(name: 'Food', transaction_type: 'Credit')
    person.categories << category
  end
end
