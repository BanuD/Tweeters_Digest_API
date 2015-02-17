class CollectorsController < ApplicationController

  def create
    leader = Leader.find_by(id: params[:params][:leader_id])
    user = User.find_by(id: params[:user_id])
    p '################## USER ID ################'
    p user.id
    p '################## LEADER ID ################'
    p params[:params][:leader_id]
    p '################## query ################'
    p params[:params][:query]
    p '################## query ################'
    p Collector.first
    p '################## query ################'
    collector = Collector.find_by(leader_id: params[:params][:leader_id], user_id: params[:user_id])
    if collector
      collector.query = params[:params][:query]
      if collector.query == ""
        collector.destroy
      else
        collector.save
      end
    else
      collector = Collector.create(leader_id: leader.id, user_id: user.id, query: params[:params][:query])
      ################################
      # This code chunk here is a bit redundant since the same can be accomplished by hitting the create route in the tweets controller. We put it here in case the front end is designed in a way that it needs the database to be populated with relevant tweets right away (no promises etc).
      leader = Leader.find_by(id: collector.leader_id)
      tweets = TwitterData.basic_search({handle: leader.handle, query: collector.query})
      tweets.map { |tweet| Tweet.create(collector_id: collector.id, content: tweet.text, tweet_id: tweet.id) }
      ################################
    end
    render json: {collector: collector}
  end


  def update
    collector_id = params[:collector_id]
    collector = Collector.find_by(id: collector_id)
    collector.query = params[:query]
    if collector.query == ""
      collector.destroy
    else
      collector.save
      render json: {collector: collector}
    end
  end


  def destroy
    collector = Collector.find_by(id: params[:collector_id])
    collector.destroy
  end


  # Fetch all collectors belonging to a user
  def index
    user = User.find_by(id: params[:user_id])
    collectors = user.collectors
    render json: collectors
  end



end
