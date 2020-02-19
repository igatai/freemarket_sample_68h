Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'products#index'

  resources :users, only: [:index, :new, :create]
  resources :registration, only: [:index, :new, :create]

  resources :useraddress, only: [:index]
  resources :purchase, only: :new
  resources :credit, only: :new
  resources :useraddress, only: :new
end
