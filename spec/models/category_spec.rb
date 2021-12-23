# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    let!(:new_category) { Category.create(name: 'New category') }

    it 'has empty name' do
      new_category.name = nil
      expect(new_category).not_to be_valid
    end

    it 'has too short name' do
      new_category.name = 'M'
      expect(new_category).not_to be_valid
    end

    it 'has to long name' do
      new_category.name = 'Memememmememememememememmeme'
      expect(new_category).not_to be_valid
    end

    it 'has no people' do
      expect(new_category).not_to be_valid
    end
  end

  describe 'CRUD operations' do
    let!(:user) do
      User.create(name: 'User_category', email: 'user_category@mail.ru', password: '123456',
                  password_confirmation: '123456')
    end

    let!(:person) { Person.create(name: 'Person', user_id: user.id) }

    it 'creates new category' do
      category = Category.create(name: 'Category')
      category.people << person
      expect(category.people.any?).to be_truthy
    end
  end
end
