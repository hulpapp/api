Rails.application.routes.draw do
  resources :addresses
  resources :trainments
  resources :donations

  get '/isalive', to: 'is_alive#index'
  get '/token/:keyword', to: 'token#authorize'
  get '/temp_token', to: 'token#temp_token'


end
