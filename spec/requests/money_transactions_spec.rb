# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/transactions', type: :request do
  describe 'Valid pages' do
    let!(:user) do
      User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    end

    it 'show new transaction form' do
      login_as(user, scope: :user)
      get '/money_transactions/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'CRUD operations' do
    let!(:user) do
      User.create(name: 'User', email: 'user@mail.ru', password: '123456', password_confirmation: '123456')
    end

    let!(:person) { Person.create(name: 'Person', user_id: user.id) }

    it 'creates new transaction' do
      person.categories << Category.create(name: 'Category')
      MoneyTransaction.create(amount_value: 2000, person_category_id: person.person_categories.first.id)
      expect(person.person_categories.first.money_transactions).to be_truthy
    end

    it 'deletes transaction' do
      person.categories << Category.create(name: 'Category')
      transaction = MoneyTransaction.create(amount_value: 3000, person_category_id: person.person_categories.first.id)
      expect { transaction.destroy }.to change(MoneyTransaction, :count).by(-1)
    end
  end
end
