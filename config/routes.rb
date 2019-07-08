Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tickets, only: [:index, :new, :create]

  resources :tickets, only: :show do
    scope module: :tickets do
      resources :comments, only: :create
      resources :statuses, only: :update
    end
  end

  resource  :users,   only: [:show]

  scope module: :users, path: 'users' do
    resource :account_informations, only: [:edit, :update]
    resource :change_passwords,     only: [:edit, :update]
  end

  root to: 'tickets#index'
end
