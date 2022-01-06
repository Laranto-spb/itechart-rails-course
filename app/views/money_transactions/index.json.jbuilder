# frozen_string_literal: true

json.array! @money_transactions, partial: 'transactions/transaction', as: :transaction
