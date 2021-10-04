Rails.application.routes.draw do
  resources :roles
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

  get '/roles/users/:user_id', to: 'roles#role_by_user'
  get '/roles/events/:event_id', to: 'roles#role_by_event'


  post '/signup', to: 'session#signup'
  get '/isalive', to: 'is_alive#index'
  post '/token/:keyword', to: 'token#login'
  get '/temp_token', to: 'token#temp_token'

end
