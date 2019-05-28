Rails.application.routes.draw do
  resources :users
  resources :books
  resources :authors do
    resources :books, only: [:show, :index, :new, :edit]
  end
  resources :sessions
  get '/auth/facebook/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  # get '/signin' => 'users#new'
  get '/signout' => 'sessions#destroy', :as => :signout
  # get '/signout' => 'users#destroy'
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
