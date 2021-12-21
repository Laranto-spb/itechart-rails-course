# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonCategory, type: :model do
  let!(:user) do
    User.create(name: 'User_category', email: 'user_category@mail.ru', password: '123456',
                password_confirmation: '123456')
  end

  let!(:person) { Person.create(name: 'Person', user_id: user.id) }
  let!(:person2) { Person.create(name: 'Person2', user_id: user.id) }
  let!(:category) { Category.create(name: 'Category') }

  it 'deletes with person' do
    category.people << person
    person.destroy

    expect(PersonCategory.find_by(person_id: person.id)).to be_falsy
  end
end
