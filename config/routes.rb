Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pages, only: [:index]
  resources :users, only: [:show, :edit, :update]
  resources :flats
  get '/flats/search', to: 'flats#search'
  resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
