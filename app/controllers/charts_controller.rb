# frozen_string_literal: true

class ChartsController < ApplicationController
  before_action :set_user_people, only: %i[index]
  before_action :set_user_categories, only: %i[index]

  def index
    if validate_date(params)
      @start_date = Time.zone.today.beginning_of_month
      @end_date = format_date(Time.zone.today)
    else
      @start_date = DateTime.parse(params[:search][:start_date])
      @end_date = format_date(DateTime.parse(params[:search][:end_date]))
    end

    set_credits
    set_debits
  end

  private

  def get_credit_transactions(categories, start_d, end_d)
    credit_transaction = []
    categories.select { |c| c.transaction_type == 'Credit' }.each do |credit|
      transactions = MoneyTransaction.where(person_category_id: credit.person_categories,
                                            created_at: start_d..end_d).sum(&:amount_value)
      credit_transaction += [[credit.name, transactions]] if transactions.positive?
    end
    credit_transaction
  end

  def get_debit_transactions(categories, start_d, end_d)
    debit_transaction = []
    categories.select { |c| c.transaction_type == 'Debit' }.each do |debit|
      transactions = MoneyTransaction.where(person_category_id: debit.person_categories,
                                            created_at: start_d..end_d).sum(&:amount_value)
      debit_transaction += [[debit.name, transactions]] if transactions.positive?
    end
    debit_transaction
  end

  def format_date(date)
    date.to_datetime.end_of_day
  end

  def set_user_people
    @people = current_user.people
  end

  def set_user_categories
    @categories = current_user.people.collect(&:categories).flatten.uniq
  end

  def set_credits
    @credits = get_credit_transactions(@categories, @start_date, @end_date)
  end

  def set_debits
    @debits = get_debit_transactions(@categories, @start_date, @end_date)
  end

  def validate_date(params)
    params[:search].nil? || params[:search][:start_date].empty? || params[:search][:end_date].empty?
  end
end
