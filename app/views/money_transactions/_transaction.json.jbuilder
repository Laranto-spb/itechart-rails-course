# frozen_string_literal: true

json.extract! money_transaction, :id, :amount_value, :person_category_id, :created_at, :updated_at
json.url transaction_url(money_transaction, format: :json)
