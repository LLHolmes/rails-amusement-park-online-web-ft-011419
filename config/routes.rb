Rails.application.routes.draw do
  root 'users#new'
  resources :attractions
  resources :users, only: [:new, :create, :show]
  post '/new_ride' => 'rides#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
