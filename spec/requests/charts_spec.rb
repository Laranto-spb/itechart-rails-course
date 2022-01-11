# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Charts', type: :request do
  describe 'GET /index' do
    user = User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')

    describe 'GET charts page' do
      it 'goes home after login' do
        login_as(user, scope: :user)
        get '/charts'
        expect(response.status).to eq(200)
      end
    end
  end
end
