Rails.application.routes.draw do
  get '/isalive', to: 'is_alive#index'
  get '/token/:keyword', to: 'token#authorize'

end
