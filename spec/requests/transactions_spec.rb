# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/transactions', type: :request do
  describe 'Valid pages' do
    let!(:user) do
      User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    end

    it 'show new transaction form' do
      login_as(user, scope: :user)
      get '/transactions/new'
      expect(response).to have_http_status(:success)
    end
  end
end
