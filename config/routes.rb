Rails.application.routes.draw do
  resources :orders
  resources :merchandisers
  resources :admins


post "/signup", to: 'merchandisers#create'
get "/me", to:'merchandisers#show'
post "/login", to: 'sessions#login'
delete '/logout', to:'sessions#destroy'
end
