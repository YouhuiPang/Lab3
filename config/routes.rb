Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  root to: 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: [:create, :destroy]
    resources :reservations, only: [:new, :create, :show, :update, :destroy]
  end

  resource :profile, only: [:show, :edit, :update], controller: 'users'
  
  get 'search', to: 'restaurants#search'

end
