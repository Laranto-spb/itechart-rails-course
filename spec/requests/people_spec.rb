# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'People', type: :request do
  before do
    let(:user) do
      User.create(id: 1, name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    end
    let(:person) { Person.create(name: 'Person1', user_id: 1) }
  end

  # tests fail

  describe 'CRUD with people' do
    it 'creates a new person' do
      expect(person).to be_valid
    end

    it 'delete person' do
      person.destroy
      expect(Person.count).to eq(0)
    end
  end
end
