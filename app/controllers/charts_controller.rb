# frozen_string_literal: true

class ChartsController < ApplicationController
  before_action :set_user_people, only: %i[index]
  before_action :set_user_categories, only: %i[index]

  # rubocop:disable Metrics/AbcSize
  def index
    if validate_date(params)
      @start_date = Time.zone.today.beginning_of_month
      @end_date = format_date(Time.zone.today)
    else
      @start_date = DateTime.parse(params[:search][:start_date])
      @end_date = format_date(DateTime.parse(params[:search][:end_date]))
    end

    @credits = get_transactions(@start_date, @end_date)
    @debits = get_transactions(@start_date, @end_date, false)
  end
  # rubocop:enable Metrics/AbcSize

  private

  def get_transactions(start_d, end_d, credit = true)
    transaction = []

    categories = credit ? Category.credit_cats(@categories) : Category.debit_cats(@categories)

    categories.each do |category|
      transactions = MoneyTransaction.where(person_category_id: category.person_categories,
                                            created_at: start_d..end_d).sum(&:amount_value)
      transaction += [[category.name, transactions]] if transactions.positive?
    end
    transaction
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

  def validate_date(params)
    params[:search].nil? ||
      params[:search][:start_date].empty? ||
      params[:search][:end_date].empty? ||
      params[:search][:start_date] > params[:search][:end_date]
  end
end
