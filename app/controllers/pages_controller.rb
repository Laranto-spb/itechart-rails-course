# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @people = current_user.people
    @categories = current_user.people.collect(&:categories).flatten.uniq
  end
end
