# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  
  describe 'CRUD operations' do

    let!(:user) do
      User.create(name: 'User_category', email: 'user_category@mail.ru', password: '123456', password_confirmation: '123456')
    end

    let!(:person) { Person.create(name: 'Person', user_id: user.id) }

    it 'creates new category' do
      category = Category.new(name: "Category")
      person.categories << category
      expect(person.categories.any?).to be_truthy

    end
  end
end
