Rails.application.routes.draw do

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'welcome/index'
  get 'welcome/contact'

  root to: 'welcome#index'
  resources :welcome
  resources :systems
  resources :companies, only: [:index, :show]
end
