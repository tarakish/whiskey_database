Rails.application.routes.draw do
  resources :flavors
  root 'staticpages#top'
  resources :whiskeys
  resources :flavors
end
