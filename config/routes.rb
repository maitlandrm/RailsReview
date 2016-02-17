Rails.application.routes.draw do
  root 'users#index'

  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'

  post '/sessions' => 'sessions#create'
  delete 'sessions/' => 'sessions#destroy'

  get '/ideas' => 'ideas#index'
  get '/ideas/:id' => 'ideas#show'
  post '/ideas' => 'ideas#create'
  delete '/ideas/:id' => 'ideas#destroy'

  post '/like' =>'likes#create'
  
end
