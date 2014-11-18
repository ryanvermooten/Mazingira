Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :troubleshoots

  root to: 'visitors#index'
  devise_for :users
  resources :users
    resources :gardeners do
      resources :living_arrangements
      resources :farming_resources
  end
   resources :admin do
    resources :metrics
  end
  end


  #get '/dropbox/authorize', to: 'dropbox#authorize', :as => :dropbox_auth
 # get '/dropbox/callback', to: 'dropbox#callback', :as =>  :dropbox_callback

 #match '/dropbox/authorize'   => 'dropbox#authorize' , :method => :get , :as => :dropbox_auth
#match '/dropbox/callback' => 'dropbox#callback' , :method => :get , :as =>  :dropbox_callback