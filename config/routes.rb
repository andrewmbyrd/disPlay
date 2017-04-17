Rails.application.routes.draw do

  get 'welcome/index'
  get 'welcome/contact'

  root to: 'welcome#index'
  resources :welcome
  resources :systems
  resources :companies, only: [:index, :show]
end
