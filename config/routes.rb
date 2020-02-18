Rails.application.routes.draw do
  root 'products#show'
  resources :useraddress, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
