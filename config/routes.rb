Rails.application.routes.draw do
  resources :orders
  resources :merchandisers
  resources :admins


post "/signup", to: 'users#create'
get "/me", to:'users#show'
post "/login", to: 'sessions#create'
delete '/logout', to:'sessions#destroy'
end
