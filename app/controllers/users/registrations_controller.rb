# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_user!
    after_action :create_person

    private

    def create_person
      Person.create(name: 'Me', user_id: current_user.id) if current_user
    end
  end
end
