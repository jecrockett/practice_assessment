Rails.application.routes.draw do
  root 'home#show'

  get '/login', to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users, only: [:new, :create, :show]
  resources :links, only: [:index]
end
