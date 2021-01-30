Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  resources :categories, except: [:destroy]
end
