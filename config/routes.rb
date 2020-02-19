Rails.application.routes.draw do
  root 'products#index'
  resources :useraddress, only: [:index]
  resources :purchase, only: :new
  resources :credit, only: :new
  resources :useraddress, only: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
