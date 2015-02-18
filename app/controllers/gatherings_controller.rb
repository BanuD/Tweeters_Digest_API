class GatheringsController < ApplicationController

  def create
    leader = Leader.find_by(id: params[:leader_id])
    user = User.find_by(id: params[:user_id])
    gathering = Gathering.find_by(leader_id: leader.id, user_id: user.id)

    # if params[:query] == "" && gathering
    #   gathering.destroy
    # elsif params[:query] != ""

    gathering.destroy if gathering

    gathering = Gathering.create(leader_id: leader.id, user_id: user.id, query: params[:query], leader_handle: leader.handle)
    end

    gathering.destroy if params[:query] == ""

    render json: {gathering: gathering}
  end

  #   # if params[:query] == "" && gathering
  #   #   gathering.destroy
  #   # elsif params[:query] != ""

  #   gathering.destroy if gathering

  #   gathering = Gathering.create(leader_id: leader.id, user_id: user.id, query: params[:query], leader_handle: leader.handle)
  #   end
  #   gathering.destroy if params[:query] == ""

  #   render json: {gathering: gathering}
  # end


      # gathering.query = params[:query]
      #   gathering.save
      # end
    # else
      ################################
      # This code chunk here is a bit redundant since the same can be accomplished by hitting the create route in the tweets controller. We put it here in case the front end is designed in a way that it needs the database to be populated with relevant tweets right away (no promises etc).
      # leader = Leader.find_by(id: gathering.leader_id)
      # tweets = TwitterData.basic_search({handle: leader.handle, query: gathering.query})
      # tweets.map { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id) }
      ################################



  def update
    gathering_id = params[:gathering_id]
    gathering = Gathering.find_by(id: gathering_id)
    gathering.query = params[:query]
    if gathering.query == ""
      gathering.destroy
    else
      gathering.save
      render json: {gathering: gathering}
    end
  end


  def destroy
    gathering = Gathering.find_by(id: params[:gathering_id])
    gathering.destroy
  end


  # Fetch all gatherings belonging to a user
  def index
    user = User.find_by(id: params[:user_id])
    gatherings = user.gatherings
    render json: {gatherings: gatherings}
  end



end
