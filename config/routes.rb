require 'sidekiq/web'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount Sidekiq::Web, at: "/sidekiq"

  resources :users do
    get '/tweets' => "tweets#all_tweets"
    resources :leaders
    resources :gatherings do
      resources :tweets
    end
  end


end
