# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  user = User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')

  describe 'GET pages' do
    it 'show login page' do
      get '/users/sign_in'
      expect(response.status).to eq(200)
    end

    it 'show home page after login' do
      login_as(user, scope: :user)
      get root_path
      expect(response.status).to eq(200)
    end

    it 'show login page after logout' do
      login_as(user, scope: :user)
      logout(:user)
      get '/users/sign_in'
      expect(response.status).to eq(200)
    end
  end

  describe 'actions with users' do
    it 'creates a new user' do
      expect(user.name).to eq('Larisa')
    end
  end
end
