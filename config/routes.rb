Rails.application.routes.draw do
  
  post 'order_items/create', to:'order_items#create', as: 'order_items'
  # Orders
  resources :orders do
    get '/payment', to: 'charges#new', as: 'new_charge'
    resources :charges, only: [:create]
    resources :reviews, only: [:new, :create]
  end
  devise_for :users

  # Landing s and dashboards
  root 'landing#index', as: 'home'
  get '/shopdashboard', to: 'seller_profiles#index', as: 'seller_profile'
  get '/dashboard/', to: 'dashboard#index', as: 'dashboard' 
  
  # Routes for profile
  post '/profiles', to: 'profiles#create', as: 'profiles'
  get '/profile/new', to: 'profiles#new', as: 'new_profile'
  get '/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profile', to: 'profiles#update'
  put '/profile', to: 'profiles#update'
  # resources :profiles, only: [:new, :edit, :create, :update]
  
  # Routes for seller profile
  
  # Routes for shop
  resources :shops do
    resources :reviews, only: [:index]
  end
  # Routes for items
  resources :items, only: [:new, :create, :update, :edit, :destroy] 
  
  # Routes for conversations
  resources :conversations do
    resources :messages
  end
end
