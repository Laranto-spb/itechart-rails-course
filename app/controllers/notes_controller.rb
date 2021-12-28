# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: %i[edit update destroy]
  before_action :set_transaction, only: %i[update destroy]

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit; end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to money_transaction_path(@money_transaction), notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to money_transaction_path(@money_transaction), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
    transaction = MoneyTransaction.find_by(note: @note)
    return if current_user == transaction.person_category.person.user

    flash[:alert] = 'You must be owner of this note'
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:body)
  end

  def set_transaction
    @money_transaction = @note.money_transaction
  end
end