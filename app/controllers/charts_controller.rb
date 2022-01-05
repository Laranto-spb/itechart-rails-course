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
    categories.select{ |c| c.transaction_type == 'Credit'}.each do |credit|
      credit_transaction += [[credit.name, MoneyTransaction.where(person_category_id: credit.person_categories).sum(&:amount_value)]]
    end
    credit_transaction

  end

  def get_debit_transactions(categories)
    debit_transaction = []
    categories.select{ |c| c.transaction_type == 'Debit'}.each do |debit|
      debit_transaction += [[debit.name, MoneyTransaction.where(person_category_id: debit.person_categories).sum(&:amount_value)]]
    end
    debit_transaction
  end


end
