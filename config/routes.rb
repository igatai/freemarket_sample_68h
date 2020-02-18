Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :users, only: [:index, :new, :create]
  resources :registration, only: [:index, :new, :create]

end
