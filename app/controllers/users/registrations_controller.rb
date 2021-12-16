# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_user!
    after_action :create_person_with_category

    private

    def create_person_with_category
      return unless current_user

      person = Person.create(name: 'Me', user_id: current_user.id)
      category = Category.create(name: 'Food', transaction_type: 'Credit')
      person.categories << category
    end
  end
end
