require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web, at: "/sidekiq"

  resources :users do
    get '/tweets' => "tweets#all_tweets"
    resources :leaders
    resources :gatherings do
      resources :tweets
    end
  end


end
