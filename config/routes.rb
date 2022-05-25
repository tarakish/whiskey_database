Rails.application.routes.draw do
  root 'staticpages#top'

  resources :drink_ways
  resources :whiskeys
  resources :flavors
  resources :snacks
  resources :users
  resource :search, only: :new

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy', as: :logout

  get '/login_as/:user_id', to: 'user_sessions#login_as', as: :login_as if Rails.env.development?
end
