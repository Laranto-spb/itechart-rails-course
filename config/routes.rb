# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notes, except: %i[index show new]
  resources :money_transactions, except: %i[index]
  resources :categories, except: [:index]
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  resources :people
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'pages#home'

  get '/charts', to: 'charts#index'
end
