class TweetsController < ApplicationController
  # send client all tweets belonging to a user (client to api)
  def all_tweets
    user  = User.find_by(id: params[:user_id])
    tweets = []
    user.collectors.each do |collector|
      tweets << collector.tweets
    end
    render json: {tweets: tweets}
  end

end
