Rails.application.routes.draw do
  root                          "items#index"
  devise_for :users
  resources  :items,             only: [:index, :show]
  resources  :addresses,         only: [:new, :create]
  resources  :creditcards,       only: [:new, :create]
end
