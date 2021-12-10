# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'People', type: :request do
  describe 'CRUD with people' do
    let(:user) do
      User.create(id: 1, name: 'User', email: 'user@mail.ru', password: '123456', password_confirmation: '123456')
    end

    let(:person1) { Person.create(name: 'Person1', user_id: user.id) }
    let(:person2) { Person.create(name: 'Person2', user_id: user.id) }

    it 'creates 2 persons' do
      expect(person1).to be_valid
    end

    it 'delete person' do
      person1.destroy
      expect(Person.exists?(person1.id)).to be_falsey
    end
  end
end
