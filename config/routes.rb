Rails.application.routes.draw do
  get 'flats/index'

  get 'flats/show'

  get 'flats/new'

  get 'flats/create'

  get 'flats/edit'

  get 'flats/update'

  get 'flats/destroy'

  devise_for :users
  resources :pages, only: [:index]
  resources :users, only: [:show]
  resources :flats
  resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
