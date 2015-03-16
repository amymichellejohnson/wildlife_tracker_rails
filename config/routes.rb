Rails.application.routes.draw do
  root :to => 'species#index'
  
  resources :species
end
