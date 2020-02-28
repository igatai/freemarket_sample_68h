Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'products#index'

  resources :users, only: [:new, :create, :show]
  resources :registration, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create, :show, :destroy] do
  #Ajax用
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :useraddress, only: [:index]
  
  resources :purchase, only: [:show] do
    collection do
      get 'show', to: 'purchase#show'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  resources :credit, only: [:index, :new, :create]
  resources :useraddress, only: :new

  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :products, only: :show
end
