Rails.application.routes.draw do
  root 'staticpages#top'
  resources :whiskeys
end
