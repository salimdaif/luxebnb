Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :pages, only: [:index]
  get '/search', to: 'flats#search'

  resources :users, only: [:show, :edit, :update]
  resources :flats do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
