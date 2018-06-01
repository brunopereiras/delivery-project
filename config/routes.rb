Rails.application.routes.draw do

  root "hotsite#index"

  get 'hotsite/index'
  get 'hotsite/about'

  resources :user_types
  resources :users

  get '/login', to: 'user_session#new'
  post '/login', to: 'user_session#create'
  delete '/logout', to: 'user_session#destroy'

  resources :establishments
  resources :product_categories
  resources :products

end
