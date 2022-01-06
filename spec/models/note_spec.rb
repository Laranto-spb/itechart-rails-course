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
end
