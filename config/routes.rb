Rails.application.routes.draw do
  resources :users
  resources :books
  resources :authors do
    resources :books, only: [:show, :index, :new, :edit]
  end
  resources :sessions
  get '/auth/facebook/callback' => 'sessions#create'
  
  get '/signin' => 'users#new', :as => :signin
  post '/signin' => 'users#create'
  delete '/signout' => 'users#destroy', :as => :signout

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
