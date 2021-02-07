Rails.application.routes.draw do

  root "sessions#main"

  get '/users/:id/hidden', to: 'users#hidden', as: 'hidden'
  # post '/users/:id/clients/:id/new', to: 'clients#edit'

  resources :businesses
  resources :users do
    resources :clients, :admins, :contractors
  end

  resources :clients, through: :users
  resources :contractors, through: :users
  resources :admins, through: :users
  resources :jobs


  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]

  get '/login', to: 'sessions#new'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


