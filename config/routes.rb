Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  resources :categories, except: [:destroy]
  resources :branches, except: [:destroy]
  resources :departments, except: [:destroy]
end
