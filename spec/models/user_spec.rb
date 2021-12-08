# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:new_user) do
    described_class.new(
      id: 1,
      name: 'Larisa',
      email: 'larisa@gmail.com',
      password: '123456'
    )
  end

  describe 'Validations' do
    it 'is valid with all attributes' do
      expect(new_user).to be_valid
    end

    it 'has a valid email' do
      new_user.email = 'largmail.com'
      expect(new_user).not_to be_valid
    end

    it 'does not have an empty password' do
      new_user.password = ''
      expect(new_user).not_to be_valid
    end

    it 'does not have short password' do
      new_user.password = '123'
      expect(new_user).not_to be_valid
    end

    it 'does not have an empty email' do
      new_user.email = ''
      expect(new_user).not_to be_valid
    end
  end
end
