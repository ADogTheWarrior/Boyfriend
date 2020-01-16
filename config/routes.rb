Rails.application.routes.draw do
  get 'users/largest_bookshelf' => 'users#largest_bookshelf'

  get 'favorite/:id' => 'userbooks#favorite'
  post 'favorite/:id' => 'userbooks#favorite'

  root 'sessions#new'

  get '/auth/google_oauth2/callback' => 'sessions#create'

  get '/signin' => 'users#new', :as => :signin
  post '/signin' => 'users#create'
  delete '/signout' => 'users#destroy', :as => :signout

  get '/login' => 'sessions#new'
  # get '/sessions/new', to: 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :sessions
    # get rid of routes im not using
  resources :users
  resources :userbooks
  resources :books
  resources :authors do
    resources :books, only: [:show, :index, :new, :edit]
  end
end
