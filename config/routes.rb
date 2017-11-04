Rails.application.routes.draw do
  
  root 'landing#index', as: 'home'

  

  get '/myprofile', to: 'profiles#show', as: 'profile'
  post '/profiles', to: 'profiles#create', as: 'profiles'
  get '/myprofile/new', to: 'profiles#new', as: 'new_profile'
  get '/myprofile/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/myprofile', to: 'profiles#update'
  put '/myprofile', to: 'profiles#update'
  # resources :profiles, only: [:new, :edit, :create, :update]
 
  get '/sellerprofile', to: 'seller_profiles#show', as: 'seller_profile'
  post '/sellerprofiles', to: 'seller_profiles#create', as: 'seller_profiles'
  get '/sellerprofile/new', to: 'seller_profiles#new', as: 'new_seller_profile'
  get '/sellerprofile/edit', to: 'seller_profiles#edit', as: 'edit_seller_profile'
  patch '/sellerprofile', to: 'seller_profiles#update'
  put '/sellerprofile', to: 'seller_profiles#update'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
