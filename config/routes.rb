Rails.application.routes.draw do

  resources :admins
  resources :users
  resources :clients
  resources :jobs

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
