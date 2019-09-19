Rails.application.routes.draw do
  get 'users/largest_bookshelf' => 'users#largest_bookshelf'

  resources :users
  resources :books
  resources :authors do
    resources :books, only: [:show, :index, :new, :edit]
  end

  root 'sessions#new'

  resources :sessions
  get '/auth/google_oauth2/callback' => 'sessions#create'

  get '/signin' => 'users#new', :as => :signin
  post '/signin' => 'users#create'
  delete '/signout' => 'users#destroy', :as => :signout

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
