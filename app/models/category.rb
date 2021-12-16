class Category < ApplicationRecord
    has_many :person_categories
    has_many :people, through: :person_categories
    accepts_nested_attributes_for :person_categories
end
