Rails.application.routes.draw do
  resources :discoveries
  resources :trophies
  resources :expeditions
  resources :places
  resources :explorers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
