# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'Validations' do
    let!(:new_person) { Person.create(name: 'Person', user_id: 1) }

    it 'has empty name' do
      new_person.name = nil
      expect(new_person).not_to be_valid
    end

    it 'has no user' do
      new_person.user_id = nil
      expect(new_person).not_to be_valid
    end

    it 'has too long name' do
      new_person.name = 'PersonPersonPersonPersonPersonPersonPersonPersonPersonPerson'
      expect(new_person).not_to be_valid
    end

    it 'has too short name' do
      new_person.name = 'P'
      expect(new_person).not_to be_valid
    end
  end

  describe 'CRUD operations' do
    let!(:user) do
      User.create(id: 2, name: 'User', email: 'user@mail.ru', password: '123456', password_confirmation: '123456')
    end

    let!(:person1) { Person.create(name: 'Person1', user_id: 2) }
    let!(:person2) { Person.create(name: 'Person2', user_id: 2) }

    it 'creates person' do
      expect(Person.find(person1.id)).to be_truthy
    end

    it 'delete person' do
      expect { person2.destroy }.to change(Person, :count).by(-1)
    end
  end
end
