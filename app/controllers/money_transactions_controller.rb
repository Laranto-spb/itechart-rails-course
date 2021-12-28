# frozen_string_literal: true

class MoneyTransactionsController < ApplicationController
  before_action :set_money_transaction, only: %i[show edit update destroy]
  before_action :set_person_category, only: [:destroy]
  before_action :set_person_created_for, only: %i[create update]

  # GET /transactions or /transactions.json
  def index; end

  # GET /transactions/1 or /transactions/1.json
  def show
    @person = Person.find(PersonCategory.find(@money_transaction.person_category_id).person_id)
    @category = Category.find(PersonCategory.find(@money_transaction.person_category_id).category_id)
    @note = @money_transaction.note
  end

  # GET /transactions/new
  def new
    @people = current_user.people
    @money_transaction = MoneyTransaction.new
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions or /transactions.json
  def create
    @money_transaction = MoneyTransaction.new(money_transaction_params)
    create_note(@money_transaction, params.values[1][:body])
    if @money_transaction.save
      flash[:notice] = 'Transaction was successfully created.'
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    create_note(@money_transaction, params.values[2][:body]) if !@money_transaction.note
    if @money_transaction.update(money_transaction_params) 
      flash[:notice] = 'Transaction was successfully updated.'
      redirect_to money_transaction_path(@money_transaction)
    else
      render :edit
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @money_transaction.destroy
    respond_to do |format|
      format.html { redirect_to person_path(@person), notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # create note
  def create_note(transaction, body)
    note = Note.new(body: body)
    if note.valid?
      transaction.note = note
    else
      flash[:alert] = 'Note was not saved, maybe it was invalid'
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_money_transaction
    @money_transaction = MoneyTransaction.find(params[:id])
    return if current_user == @money_transaction.person_category.person.user

    flash[:alert] = 'You must be owner of this transaction'
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def money_transaction_params
    params.require(:money_transaction).permit(:amount_value, :person_category_id)
  end

  def set_person_category
    @person = current_user.people.find(@money_transaction.person_category.person_id)
  end

  def set_person_created_for
    @person = Person.find(PersonCategory.find(money_transaction_params[:person_category_id]).person_id)
  end
end
