# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'People', type: :request do

  describe 'get pages' do

    let!(:user) do
      User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    end

    it 'has list' do
      login_as(user, scope: :user)
      get '/people'
      expect(response).to have_http_status(:success)
    end
  end

end
