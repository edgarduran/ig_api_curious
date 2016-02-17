Rails.application.routes.draw do

  get "/", to: 'landing#index'
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :profile, only: [:index]
end
