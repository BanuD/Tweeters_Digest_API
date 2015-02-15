class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def getTweets
    # debugger
    p "authenticate_user! is #{authenticate_user!}"
    p "user_signed_in? is #{user_signed_in?}"
    p "*"*100
    # p current_user
    tweets = TwitterData.basic_search({handle: "DevBootcamp", query: "gym"})
    render json: tweets
  end
end
