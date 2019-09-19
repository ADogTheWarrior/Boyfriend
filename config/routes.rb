Rails.application.routes.draw do
  get 'users/largest_bookshelf' => 'users#largest_bookshelf'

  root 'sessions#new'

  get '/auth/google_oauth2/callback' => 'sessions#create'

  get '/signin' => 'users#new', :as => :signin
  post '/signin' => 'users#create'
  delete '/signout' => 'users#destroy', :as => :signout

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :sessions
  resources :users
  resources :books
  resources :authors do
    resources :books, only: [:show, :index, :new, :edit]
  end
end
