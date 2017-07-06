Rails.application.routes.draw do
  root                          "items#index"
  devise_for :users
  resources  :users,             only: [:show] do
    resources :buyers,           only: [:index]
  end
  resources  :items,             only: [:index, :show, :new, :create] do
    resources :buyers,           only: [:new, :create]
  end
  resources  :sub_categories,    only: :index
  resources  :categories,        only: :index
  resources  :follower,          only: [:create, :destroy]
end
