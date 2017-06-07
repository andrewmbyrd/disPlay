Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :libraries do
    resources :game_purchases, only: [:show, :update, :destroy] do
      member do
        resources :comments, only: [:create]
      end
    end
    resources :system_purchases, only: [:show, :destroy]
  end

  resources :users, except: [:new, :create, :destroy]
  get 'account', to: 'users#account', as: 'users_account'
  get 'social', to: 'users#social', as: 'users_social'
  get 'warn', to: 'users#warn', as: 'users_warn'
  devise_for :users #controllers: { registrations: 'users/registrations' }
  get 'welcome/index'
  get 'welcome/contact'

  resources :welcome
  resources :systems do
    resources :system_purchases, only: [:create]
    resources :games do
      resources :game_purchases, only: [:create]
    end
  end

  resources :companies, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]

end
