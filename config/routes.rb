Rails.application.routes.draw do
  resources :snacks
  root 'staticpages#top'

  resources :drink_ways
  resources :whiskeys
  resources :flavors
end
