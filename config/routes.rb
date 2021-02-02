Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  resources :homes, only: [] do
  	collection do
  		get :get_states
  	end
  end
  resources :categories, except: [:destroy]
  resources :items, except: [:destroy]
  resources :branches, except: [:destroy]
  resources :departments, except: [:destroy]
  resources :product_models, except: [:destroy]
  resources :clients, except: [:destroy]
  resources :vendors, except: [:destroy]
  resources :users, except: [:destroy]
  
  resources :estimates, except: [:destroy] do
    member do
      post: :update_status
    end
  end
  
  resources :proformas, except: [:destroy]
  resources :sale_orders, except: [:destroy]
  resources :invoices, except: [:destroy]
end
