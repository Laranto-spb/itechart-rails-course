# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/notes', type: :request do
  describe 'Valid pages' do
    let!(:user) do
      User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    end
    let!(:person) { Person.create(name: 'Person', user_id: user.id) }

    before do
      login_as(user, scope: :user)
    end

    it 'has not general list of notes' do
      expect { get '/notes' }.to raise_error(ActionController::RoutingError)
    end
  end
end
