class GatheringsController < ApplicationController

  def create
    leader = Leader.find_by(id: params[:leader_id])
    user = User.find_by(id: params[:user_id)
    gathering = Gathering.find_by(leader_id: leader.id, user_id: user.id)
    if gathering
      gathering.query = params[:query]
      if gathering.query == ""
        gathering.destroy
      else
        gathering.save
        leader.query = leader.gathering.query
        leader.save
      end
    else
      gathering = Gathering.create(leader_id: leader.id, user_id: user.id, query: params[:query], leader_handle: leader.handle)
      leader.query = leader.gathering.query
      leader.save
    end
    render json: {gathering: gathering}
  end


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
