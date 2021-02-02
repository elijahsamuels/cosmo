Rails.application.routes.draw do

  devise_for :users
  root "sessions#main"

  get '/users/:id/hidden', to: 'users#hidden', as: 'hidden'

  resources :businesses
  resources :users
  resources :jobs

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
