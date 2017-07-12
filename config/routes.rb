Rails.application.routes.draw do
  root                          "items#index"
  devise_for :users

  resources  :users,             only: [:show] do

    collection do
      get 'sell_list'
      get 'buy_list'
    end

    resources :buyers,           only: [:index]

  end

  resources  :items,             only: [:index, :show, :new, :create] do

    collection do
      get 'search'
    end

    resources :buyers,           only: [:new, :create]

  end

  resources  :sub_categories,    only: :index
  resources  :categories,        only: :index
  resources  :followers,         only: [:index, :create, :destroy]
end
