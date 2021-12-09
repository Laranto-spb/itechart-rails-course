require 'rails_helper'

RSpec.describe 'People', type: :request do
  before(:all) do
    user = User.create(id: 1, name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    person = Person.create(name: 'Person1', user_id: 1)
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
