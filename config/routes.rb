Rails.application.routes.draw do
  root 'users#new'
  resources :attractions
  resources :users, only: [:new, :create, :show]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  # namespace :admin do
  #   resources :stats, only: [:index]
  # end
end
