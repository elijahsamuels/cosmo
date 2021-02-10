Rails.application.routes.draw do

  root "sessions#main"

  get '/users/:id/hidden', to: 'users#hidden', as: 'hidden'
  # post '/users/:id/clients/:id/new', to: 'clients#edit'

  # resources :businesses do
  #   resources :payments, only: [:index, :show, :new, :create ]
  #   end
  

  resources :users do
    resources :clients
    resources :admins
    resources :contractors
    resources :jobs
    #resources :payments, only: [:index, :show, :new, :create ]
    end
  
  resources :clients, through: :users
  resources :contractors, through: :users
  resources :admins, through: :users
  resources :jobs do #, only: [:show, :edit] 
    resources :payments #, only: [:index, :show, :new, :create, :edit]
    end


  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]

  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


