Rails.application.routes.draw do
  # devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    # # Ajaxで動くアクションのルートを作成
    # collection do
    #   get 'get_category_children', defaults: { format: 'json' }
    #   get 'get_category_grandchildren', defaults: { format: 'json' }
    # end
  resources :useraddress, only: [:index]
  resources :purchase, only: :new
  resources :credit, only: :new
  resources :useraddress, only: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
