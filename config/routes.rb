Rails.application.routes.draw do
  root 'staticpages#top'

  resources :drink_ways
  resources :whiskeys
  resources :flavors
  resources :snacks
end
