Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # Root route
  root 'restaurants#index'

  # Resources for restaurants and nested entities
  resources :restaurants do
    resources :reviews, only: [:create, :destroy]
    resources :reservations, except: [:index, :edit, :update, :destroy]
    resources :tables
  end

  # Independent reservations routes
  resources :reservations, only: [:index, :edit, :update, :destroy]

  # Route for user's reservations
  get 'my_reservations', to: 'reservations#index'

  # Singular resource for user profile
  resource :profile, only: [:show, :edit, :update], controller: 'users'

  # Route for search functionality
  get 'search', to: 'restaurants#search'

end
