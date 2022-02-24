Rails.application.routes.draw do
  resources :drink_ways
  resources :flavors
  root 'staticpages#top'
  resources :whiskeys
  resources :flavors
end
