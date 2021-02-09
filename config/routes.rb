Rails.application.routes.draw do

  root "sessions#main"

  get '/users/:id/hidden', to: 'users#hidden', as: 'hidden'
  # post '/users/:id/clients/:id/new', to: 'clients#edit'

  resources :businesses
  resources :users do
    resources :clients, :admins, :contractors, :jobs
  end

  resources :clients, through: :users
  resources :contractors, through: :users
  resources :admins, through: :users
  resources :jobs#, only: [:show, :edit]


  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]

  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


