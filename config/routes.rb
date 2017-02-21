Rails.application.routes.draw do

  devise_for :users
  resources :pages, only: [:index]
  resources :users, only: [:show]
  resources :flats
  get '/search', to: 'flats#search'
  resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
