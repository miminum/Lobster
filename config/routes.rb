Rails.application.routes.draw do
  
  resources :shops, only: [:index, :show] 

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
  get '/sellerprofile', to: 'seller_profiles#show', as: 'seller_profile'
  post '/sellerprofiles', to: 'seller_profiles#create', as: 'seller_profiles'
  get '/sellerprofile/new', to: 'seller_profiles#new', as: 'new_seller_profile'
  get '/sellerprofile/edit', to: 'seller_profiles#edit', as: 'edit_seller_profile'
  patch '/sellerprofile', to: 'seller_profiles#update'
  put '/sellerprofile', to: 'seller_profiles#update'

  
  
  # Routes for items
  resources :items

  # Routes for conversations
  resources :conversations do
    resources :messages
  end
end
