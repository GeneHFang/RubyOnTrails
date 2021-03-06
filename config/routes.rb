Rails.application.routes.draw do
  resources :discoveries
  resources :trophies
  resources :expeditions
  resources :places
  resources :explorers
  resources :users
  resources :hiscores
  root to: 'pages#home'
  get '/login', to: 'sessions#new', as: "login"
  get '/info', to: 'sessions#info', as: "info"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "logout"
  get '/explorers/:id/trophy', to: 'explorers#trophyhall', as: 'trophyhall'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
