Rails.application.routes.draw do
  devise_for :users
  root 'dashboards#index'

  resources :homes, only: [] do
  	collection do
  		get :get_states
      get :get_product
      get :find_tax
  	end
  end
  
  resources :categories, except: [:destroy] do
    collection do
      get :download_report
    end
  end
  
  resources :items, except: [:destroy] do
    collection do
      get :download_report
    end
  end
  
  resources :branches, except: [:destroy] do
    collection do
      get :download_report
    end
  end

  resources :departments, except: [:destroy]

  resources :product_models, except: [:destroy] do
    collection do
      get :download_report
    end
  end

  resources :clients, except: [:destroy] do
    collection do
      get :download_report
    end
  end

  resources :vendors, except: [:destroy] do
    collection do
      get :download_report
    end
  end

  resources :users, except: [:destroy] do
    collection do
      get :download_report
    end
  end
  
  resources :estimates, except: [:destroy] do
    member do
      post :approve
      post :reject
      get :order_notes
    end
  end
  
  resources :proformas, except: [:destroy] do
    member do
      post :update_status
      get :order_notes
    end
  end
  
  resources :sale_orders, except: [:destroy]
  resources :invoices, except: [:destroy]
  
  resources :reports, only: [] do
    collection do
      get :approvals
    end
  end
end
