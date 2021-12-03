# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'pages#home'
end
