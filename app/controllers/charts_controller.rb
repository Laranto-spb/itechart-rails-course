# frozen_string_literal: true

class ChartsController < ApplicationController
  def index
    @people = current_user.people
    @categories = current_user.people.collect(&:categories).flatten.uniq
    @credits = get_credit_transactions(@categories)
    @debits = get_debit_transactions(@categories)
  end

  private

  def get_credit_transactions(categories)
    credit_transaction = []
    categories.select { |c| c.transaction_type == 'Credit' }.each do |credit|
      transactions = MoneyTransaction.where(person_category_id: credit.person_categories,
                                            created_at: Time.zone.today.all_month).sum(&:amount_value)
      credit_transaction += [[credit.name, transactions]] if transactions.positive?
    end
    credit_transaction
  end

  def get_debit_transactions(categories)
    debit_transaction = []
    categories.select { |c| c.transaction_type == 'Debit' }.each do |debit|
      transactions = MoneyTransaction.where(person_category_id: debit.person_categories,
                                            created_at: Time.zone.today.all_month).sum(&:amount_value)
      debit_transaction += [[debit.name, transactions]] if transactions.positive?
    end
    debit_transaction
  end
end
