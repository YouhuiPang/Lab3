Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: [:create, :destroy]
    resources :reservations, only: [:new, :create, :show, :update, :destroy]
  end
  get 'search', to: 'restaurants#search'
end
