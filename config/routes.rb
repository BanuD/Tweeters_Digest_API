Rails.application.routes.draw do

  get 'getTweets' => "application#getTweets"

  post 'collectors' => "application#createCollector"

  # config/routes.rb
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks:  'omniauth_callbacks'
  }

end
