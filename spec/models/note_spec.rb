# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'Validation' do
    let!(:note) { Note.create(body: 'Some note') }

    it 'is not empty' do
      note.body = nil
      expect(note).not_to be_valid
    end

    it 'does not have too long name' do
      note.body = 'LongLong' * 10
      expect(note).not_to be_valid
    end

    it 'does not contain only whitespaces' do
      note.body = '     '
      expect(note).not_to be_valid
    end
  end

  describe 'CRUD actions' do
    let!(:user) do
      User.create(name: 'User', email: 'user@mail.ru', password: '123456', password_confirmation: '123456')
    end
    let!(:person) { Person.create(name: 'Person', user_id: user.id) }

    it 'creates new note' do
      expect { Note.create(body: 'Some description') }.to change(Note, :count).by(1)
    end

    it 'deletes note' do
      note = Note.create(body: 'Some description')
      expect { note.destroy }.to change(Note, :count).by(-1)
    end

    it 'deletes with transaction' do
      person.categories << Category.create(name: 'Category')
      transaction = MoneyTransaction.create(amount_value: 2000, person_category_id: person.person_categories.first.id)
      note = Note.create(body: 'Some description')
      transaction.note = note
      expect { transaction.destroy }.to change(Note, :count).by(-1)
    end
  end
end
