Rails.application.routes.draw do
  root 'staticpages#top'

  resources :drink_ways
  resources :flavors
  resources :snacks
  resources :users
  resources :whiskeys do
    resources :tasting_notes, shallow: true, except: %i[index show]
    resource :bookmarks, only: %i[create destroy]
  end

  resources :tasting_notes, only: :index
  resource :search, only: :new

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy', as: :logout
  
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider

  get '/login_as/:user_id', to: 'user_sessions#login_as', as: :login_as if Rails.env.development?
end
