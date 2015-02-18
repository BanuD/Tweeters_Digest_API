class TweetsController < ApplicationController

  # send client all tweets belonging to a user (client to api)
  def all_tweets
    #########
    BackgroundJobsHelper::the_tweets #populares data_base with all tweets for all users...MVP!!!!!!!
    #########
    user  = User.find_by(id: params[:user_id])
    tweets = []
    user.gatherings.each do |gathering|
      tweets << gathering.tweets
    end
    render json: {tweets: tweets}
  end


  def index
    gathering = gathering.find_by(id: params[:gathering_id])
    tweets = gathering.tweets
    render json: {tweets: tweets}
  end


  def create
    gathering = gathering.find_by(id: params[:gathering_id])
    leader = Leader.find_by(id: gathering.leader_id)
    if gathering.query == "*"
      tweets = TwitterData.complete_search({handle: leader.handle})
    else
      tweets = TwitterData.basic_search({handle: leader.handle, query: gathering.query})
    end
    tweets.map { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id, handle: leader.handle, url: tweet.url.to_s)}
    render json: {tweets: tweets}
  end

end
