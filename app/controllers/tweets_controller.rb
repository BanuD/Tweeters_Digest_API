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


  def index
    collector = collector.find_by(id: params[:collector_id])
    tweets = collector.tweets
    render json: {tweets: tweets}
  end


  def create
    collector = collector.find_by(id: params[:collector_id])
    leader = Leader.find_by(id: collector.leader_id)
    tweets = TwitterData.basic_search({handle: leader.handle, query: collector.query})
    tweets.map { |tweet| Tweet.create(collector_id: collector.id, content: tweet.text, tweet_id: tweet.id) }
    render json: {tweets: tweets}
  end

end
