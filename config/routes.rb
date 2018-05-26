Rails.application.routes.draw do
  
  root "user_types#index"
  
  resources :user_types
  resources :users
  
  get '/login', to: 'user_session#new'
  post '/login', to: 'user_session#create'
  delete '/logout', to: 'user_session#destroy'

end
