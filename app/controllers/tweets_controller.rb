class TweetsController < ApplicationController

  # send client all tweets belonging to a user (client to api)
  def all_tweets
    user  = User.find_by(id: params[:user_id])

    #populates data_base with all tweets for specific user.
    BackgroundJobsHelper.tweets_for_specific_user(user.id)

    tweets = []
    user.gatherings.each do |gathering|
      tweets << gathering.tweets
    end
    #flatten tweets array into 1 array
    #sort the flattened array by tweet_creation_time
    tweets.map do |tweet|
      tweets.sort! {|tweet1, tweet2| tweet2.tweet_creation_time <=> tweet1.tweet_creation_time}
    end

    render json: {tweets: tweets}
  end


  def index
    gathering = gathering.find_by(id: params[:gathering_id])
    tweets = gathering.tweets

    tweets.map do |tweet|
      tweets.sort! {|tweet1, tweet2| tweet2.tweet_creation_time <=> tweet1.tweet_creation_time}
    end

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
    tweets.map { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id, handle: leader.handle, url: tweet.url.to_s, leader_pic_url: leader.profile_image_url_https, tweet_creation_time: tweet.created_at)}

    tweets.map do |tweet|
      tweets.sort! {|tweet1, tweet2| tweet2.tweet_creation_time <=> tweet1.tweet_creation_time}
    end

    render json: {tweets: tweets}
  end

end
