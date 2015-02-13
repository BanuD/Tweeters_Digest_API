Rails.application.routes.draw do

  resources :users

  root 'welcome#index'
  get 'auth/twitter/callback', to: 'sessions#create'
  # can change this to be the following to make it not limited to twitter: match 'auth/:provider/callback', to: 'sessions#create'
end
