# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoneyTransaction, type: :model do
  describe 'Validations' do
    let!(:user) do
      User.create(name: 'User', email: 'user@mail.ru', password: '123456', password_confirmation: '123456')
    end
    let!(:person) { Person.create(name: 'Person', user_id: user.id) }

    it 'has empty amount_value' do
      person.categories << Category.create(name: 'Category')
      transaction = MoneyTransaction.create(amount_value: nil, person_category_id: person.categories.first)
      expect(transaction).not_to be_valid
    end

    it 'has only positive number' do
      person.categories << Category.create(name: 'Category')
      transaction = MoneyTransaction.create(amount_value: -190, person_category_id: person.categories.first)
      expect(transaction).not_to be_valid
    end
  end
end
