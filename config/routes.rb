Rails.application.routes.draw do

  root "sessions#main"
  get '/search', to: 'users#search', :as => 'search'

  get '/users/:id/hidden', to: 'users#hidden', as: 'hidden'
  # post '/users/:id/clients/:id/new', to: 'clients#edit'

  # resources :businesses do
  #   resources :payments, only: [:index, :show, :new, :create ]
  #   end 
  
  # USERS
  resources :users do
    resources :clients
    resources :admins
    resources :contractors
    resources :jobs
    resources :invoices, except: [:destroy]
    #resources :payments, only: [:index, :show, :new, :create ]
  end
  
  resources :clients, through: :users
  resources :contractors, through: :users
  resources :admins, through: :users
  
  resources :jobs do #, only: [:show, :edit] 
    resources :payments #, only: [:index, :show, :new, :create, :edit]
    resources :invoices, except: [:destroy]
  end


  # Sessions, Login, Signup, Logout
  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '*path', via: :all, to: 'application#not_found'
  post '*path', via: :all, to: 'application#not_found'


end


