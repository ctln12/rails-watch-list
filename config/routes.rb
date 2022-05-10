# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'lists#index'

  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[new create]
  end
end
