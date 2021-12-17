# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, except: [:index, :destroy]
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :people
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'pages#home'
end
