Rails.application.routes.draw do
  resources :trainments
  resources :donations
  get '/isalive', to: 'is_alive#index'
  get '/token/:keyword', to: 'token#authorize'

end
