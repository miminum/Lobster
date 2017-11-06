Rails.application.routes.draw do
  post 'order_items/create', to:'order_items#create', as: 'order_items'

  resources :orders
  devise_for :users

  # Landing Page
  root 'landing#index', as: 'home'

  get '/dashboard/', to: 'dashboard#index', as: 'dashboard' 
  
  # Routes for profile
  get '/myprofile', to: 'profiles#show', as: 'profile'
  post '/profiles', to: 'profiles#create', as: 'profiles'
  get '/myprofile/new', to: 'profiles#new', as: 'new_profile'
  get '/myprofile/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/myprofile', to: 'profiles#update'
  put '/myprofile', to: 'profiles#update'
  # resources :profiles, only: [:new, :edit, :create, :update]
  
  # Routes for seller profile
  get '/sellerprofile', to: 'seller_profiles#index', as: 'seller_profile'
  
  # Routes for shop
  resources :shops, only: [:show, :new, :update, :edit, :destroy]   
  # Routes for items
  resources :items
  
  # Routes for conversations
  resources :conversations do
    resources :messages
  end
end
