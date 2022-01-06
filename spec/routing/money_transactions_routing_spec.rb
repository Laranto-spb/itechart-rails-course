# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoneyTransactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/money_transactions/new').to route_to('money_transactions#new')
    end

    it 'routes to #edit' do
      expect(get: '/money_transactions/1/edit').to route_to('money_transactions#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/money_transactions').to route_to('money_transactions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/money_transactions/1').to route_to('money_transactions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/money_transactions/1').to route_to('money_transactions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/money_transactions/1').to route_to('money_transactions#destroy', id: '1')
    end
  end
end
