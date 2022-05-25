Rails.application.routes.draw do
  root 'staticpages#top'

  resources :drink_ways
  resources :whiskeys
  resources :flavors
  resources :snacks
  #resources :users 意図しないユーザー登録を避けるため一時退避

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy', as: :logout
  get 'search', to: 'searches#new', as: :search

  get '/login_as/:user_id', to: 'user_sessions#login_as', as: :login_as if Rails.env.development?
end
