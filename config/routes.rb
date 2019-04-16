Rails.application.routes.draw do
  resources :users
  resources :books
  resources :authors do
    resources :books, only: [:show, :index, :new, :edit]
  end
  resources :sessions
  get '/auth/facebook/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/signin' => 'sessions#new', :as => :signin
  delete '/logout' => 'sessions#destroy'
end
