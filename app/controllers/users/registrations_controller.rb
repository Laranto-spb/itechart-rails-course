# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_user!
    after_action :create_person

    private

    def create_person
      return unless current_user

      person = Person.create(name: 'Me', user_id: current_user.id)

      if Category.all.any?
        person.categories << Category.all.first
      else
        category = Category.create(name: 'Food', transaction_type: 'Credit')
        person.categories << category
      end
    end
  end
end
