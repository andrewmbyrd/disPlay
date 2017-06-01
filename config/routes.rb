Rails.application.routes.draw do

  root to: 'welcome#index'
  resources :libraries do
    resources :game_purchases, only: [:show, :update]
  end
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  put 'users/update'
  get 'users/destroy'


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

end
