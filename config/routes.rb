Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :libraries do
    resources :game_purchases, only: [:show, :update, :destroy]
    resources :system_purchases, only: [:show, :destroy]
  end

  get 'users/show'
  get 'users/index'
  get 'users/edit'
  put 'users/update'
  delete 'users/destroy'

  devise_for :users, controllers: { registrations: 'users/registrations' }
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
