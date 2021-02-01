Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  resources :homes, only: [] do
  	collection do
  		get :get_states
  	end
  end
  resources :categories, except: [:destroy]
  resources :branches, except: [:destroy]
  resources :departments, except: [:destroy]
  resources :product_models, except: [:destroy]
end
