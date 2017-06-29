Rails.application.routes.draw do
  root                          "items#index"
  devise_for :users
  resources  :items,             only: [:index, :show, :new, :create] do
    collection do
      get 'buy'
      get 'finish'
    end
  end
  resources  :sub_categories,    only: :index
  resources  :categories,        only: :index
end
