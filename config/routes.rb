Rails.application.routes.draw do


  # config/routes.rb
    # devise_for :users

    get 'getTweets' => "application#getTweets"

    post 'collectors' => "application#createCollector"


        mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          omniauth_callbacks:  'omniauth_callbacks'
        }
    end
