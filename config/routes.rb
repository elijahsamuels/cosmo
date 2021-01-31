Rails.application.routes.draw do

  root "sessions#main"

  get '/users/:id/hidden', to: 'users#hidden', as: 'hidden'

  resources :admins, only: [:new, :create, :index, :show, :edit, :update] do 
    resources :jobs
  end
  resources :users
  resources :clients
  resources :jobs

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
