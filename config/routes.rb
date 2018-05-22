Rails.application.routes.draw do
  
  root "user_types#index"
  
  resources :user_types
  
end
