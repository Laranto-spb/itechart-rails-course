# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/categories', type: :request do
  describe 'Routing' do
    let!(:user) do
      User.create(name: 'Larisa', email: 'lar@mail.ru', password: '123456', password_confirmation: '123456')
    end

    it 'has not general list of categories' do
      login_as(user, scope: :user)
      expect { get '/categories' }.to raise_error(ActionController::RoutingError)
    end
  end
end
