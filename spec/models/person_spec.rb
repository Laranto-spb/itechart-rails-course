# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:new_person) do
    described_class.new(
      name: 'Dad',
      user_id: 1
    )
  end

  describe 'Validations' do
    it 'does not have empty name' do
      new_person.name = nil
      expect(new_person).not_to be_valid
    end

    it 'has user' do
      new_person.user_id = nil
      expect(new_person).not_to be_valid
    end
  end
end
