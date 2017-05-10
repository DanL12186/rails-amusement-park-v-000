Rails.application.routes.draw do

  root "application#index"

  resources :attractions
  resources :users
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
