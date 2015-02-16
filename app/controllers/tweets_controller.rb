class TweetsController < ApplicationController



    # send all tweets belonging to a specific collector (client to api)
  def create
    collector = Collector.find_by(id: params[:collector_id])

    leader = Leader.find_by(id: collector.leader_id)
    #created collector now we have to pass collector to basic search to get back tweets
    tweets = TwitterData.basic_search({handle: leader.twitter_object.nickname, query: collector.query})

    #create tweet objects out of the array of returned tweets.
    tweets.map do |tweet|
      Tweet.create(collector_id: collector.id, content: tweet)
    end
    #send tweets to front end in the form of json
    render :json tweets
  end

  # send client all tweets belonging to a user (client to api)
  def all_tweets
    tweets = current_user.collectors.tweets
    render :json tweets
  end

end
