Rails.application.routes.draw do
  resources :orders
  resources :merchandisers
  resources :admins
post "/signup", to: 'merchandisers#create'
get "/me", to:'merchandisers#show'
post "/login", to: 'sessions#create'
delete '/logout', to:'sessions#destroy'
patch '/reset', to:'merchandisers#reset'

end
