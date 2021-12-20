# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_current_user_people, only: %i[index new]

  # GET /categories or /categories.json
  def index
    @people = current_user.people
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
    @people = current_user.people
  end

  # GET /categories/1/edit
  def edit
    @people = current_user.people
  end

  # POST /categories or /categories.json
  def create
    begin
      Category.transaction do
        @category = Category.new(category_params)
        @category.save!

      end

    rescue ActiveRecord::RecordInvalid => invalid
      return invalid.record.errors
    end

    flash[:notice] = 'Category was successfully created.'
    redirect_to @category
    
    # respond_to do |format|
    #   if @category.save
    #     format.html { redirect_to @category, notice: 'Category was successfully created.' }
    #     format.json { render :show, status: :created, location: @category }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @category, alert: 'Sorry, some person has this category alone' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :transaction_type, person_ids: [])
  end

  # Set people for current user
  def set_current_user_people
    @people = current_user.people
  end
end
