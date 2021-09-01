Rails.application.routes.draw do
  resources :routes_have_locals
  resources :events_have_locals
  resources :routes
  resources :locals
  resources :teams_have_volunteers
  resources :certificates
  resources :organizers
  resources :presences
  resources :drivers
  resources :volunteers
  resources :beneficiaries
  resources :teams
  resources :events
  resources :users
  resources :addresses
  resources :trainments
  resources :donations

  post '/login' => 'session#login'
  get '/isalive', to: 'is_alive#index'
  get '/token/:keyword', to: 'token#authorize'
  get '/temp_token', to: 'token#temp_token'

end
