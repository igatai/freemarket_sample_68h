Rails.application.routes.draw do
  # devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :create, :show]
  resources :useraddress, only: [:index]
  resources :purchase, only: :new
  resources :credit, only: :new
  resources :useraddress, only: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
