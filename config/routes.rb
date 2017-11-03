Rails.application.routes.draw do
  
  get 'seller_profiles/show'

  get '/myprofile', to: 'profiles#show', as: 'profile'
  post '/profiles', to: 'profiles#create', as: 'profiles'
  get '/myprofile/new', to: 'profiles#new', as: 'new_profile'
  get '/myprofile/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/myprofile', to: 'profiles#update'
  put '/myprofile', to: 'profiles#update'
  # resources :profiles, only: [:new, :edit, :create, :update]
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
