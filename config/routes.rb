Rails.application.routes.draw do

  resources :libraries
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  post 'libraries/add_system'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'welcome/index'
  get 'welcome/contact'

  root to: 'welcome#index'
  resources :welcome
  resources :systems
  resources :companies, only: [:index, :show]
end
