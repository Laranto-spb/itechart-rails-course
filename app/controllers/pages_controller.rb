# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @people = current_user.people
  end
end
