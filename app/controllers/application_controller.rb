class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def getTweets
    # p "authenticate_user! is #{authenticate_user!}"
    # p "user_signed_in? is #{user_signed_in?}"
    # p "*"*100
    # debugger
    # p auth_headers["client"]
    tweets = TwitterData.basic_search({handle: "DevBootcamp", query: "I"})
    render json: tweets
  end

  def createCollector
    collector = current_user.collector.create(leader: params[:leader], query: params[:query])
    render json: collector
  end
end
