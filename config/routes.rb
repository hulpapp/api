Rails.application.routes.draw do
  resources :gambis
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :event_places
  root to: "is_alive#index"

  resources :events_have_teams
  resources :manage_donations
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

  get '/teams-by-events/:id', to: 'events_have_teams#show_teams_by_events'
  get '/events-by-teams/:id', to: 'events_have_teams#show_events_by_teams'

  post '/create_eventplaces', to: 'event_places#create_eventplaces'
  post '/team_have_vol', to: 'teams_have_volunteers#create_temhvol'
  get '/events/:event_id/places', to: 'event_places#find_by_event'

  get 'events/:event_id/teams', to: 'teams#find_teams_by_event'
  get '/teams-by-responsible/:responsible_id', to: 'teams#find_teams_by_responsible'


  get '/gambis/vol/:volunteer_id', to: 'gambis#vol'
  get '/gambis/event/:event_id', to: 'gambis#event'

  post '/signup', to: 'session#signup'
  get '/isalive', to: 'is_alive#index'
  post '/login', to: 'token#login'
  get '/temp_token', to: 'token#temp_token'

  get '/presences/event/:event_id/volunteer/:volunteer_id', to: 'presences#find_presence_by_volunteer_and_event'

  get '/event_places/:event_id', to: 'event_places#find_by_event'

  post '/donations/event/:event_id', to: 'donations#create_donation_assoc_to_event'
  get '/donations/find-by-event/:event_id', to: 'donations#find_donation_quantities_by_event'

  get '/generate_report/:event_id', to: 'report#generate_report'
end
