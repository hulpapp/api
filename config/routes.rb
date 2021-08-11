Rails.application.routes.draw do
  get '/isalive', to: 'is_alive#index'
end
