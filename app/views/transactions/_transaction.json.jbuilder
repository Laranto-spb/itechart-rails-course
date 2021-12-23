json.extract! transaction, :id, :amount_value, :person_category_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
