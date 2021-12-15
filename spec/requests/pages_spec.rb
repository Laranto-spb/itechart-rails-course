# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  user = User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')

  describe 'GET pages' do
    it 'goes home after login' do
      login_as(user, scope: :user)
      get root_path
      expect(response.status).to eq(200)
    end
  end
end
