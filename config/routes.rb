Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  resources :authors do
    resources :books, only: [:show, :index]
  end
  resources :sessions
  get '/auth/facebook/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/signin' => 'sessions#new', :as => :signin
end
