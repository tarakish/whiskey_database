Rails.application.routes.draw do
  root 'staticpages#top'

  resources :drink_ways, only: :index
  resources :flavors, only: :index
  resources :snacks, only: :index
  resources :users, only: %i[index show edit update destroy]
  resources :whiskeys, only: %i[index show] do
    resources :tasting_notes, shallow: true, only: %i[create update destroy]
    resource :bookmarks, only: %i[create destroy]
  end
  resources :tasting_notes, only: :index
  resource :search, only: :new

  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy', as: :logout
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  get '/login_as/:user_id', to: 'user_sessions#login_as', as: :login_as if Rails.env.development?

  namespace :admin do
    root 'dashboards#top'
    resources :whiskeys
    resources :drink_ways, only: %i[index new create edit update destroy]
    resources :flavors, only: %i[index new create edit update destroy]
    resources :snacks, only: %i[index new create edit update destroy]
    resources :users, only: %i[index new create edit update destroy]
    resources :tasting_notes, only: %i[index new create edit update destroy]
  end

  get '*path', controller: 'application', action: 'render404'
end
