Rails.application.routes.draw do
  
  root "hotsite#index"
  
  get '/login', to: 'user_session#new'
  post '/login', to: 'user_session#create'
  delete '/logout', to: 'user_session#destroy'

  get 'hotsite/index'
  get 'hotsite/about'

  resources :user_types
  resources :users

end
