# frozen_string_literal: true

Rails.application.routes.draw do
  root "exchange_rates#index"
  resources :exchange_rates
end
