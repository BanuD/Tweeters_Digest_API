Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # get 'getTweets' => "application#getTweets"

  resources :users do
    get '/tweets' => "tweets#all_tweets"
    resources :leaders
    resources :collectors do
      resources :tweets
    end
  end

end
