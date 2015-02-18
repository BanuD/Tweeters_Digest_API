class GatheringsController < ApplicationController

  # Fetch all gatherings belonging to a user
  def index
    user = User.find_by(id: params[:user_id])
    gatherings = user.gatherings
    render json: {gatherings: gatherings}
  end

  def create
    leader = Leader.find_by(id: params[:leader_id])
    user = User.find_by(id: params[:user_id])
    gathering = Gathering.find_by(leader_id: leader.id, user_id: user.id)
    if gathering
      gathering.destroy
      gathering = Gathering.create(leader_id: leader.id, user_id: user.id, query: params[:query], leader_handle: leader.handle) if (params[:query] != "")
    else
      gathering = Gathering.create(leader_id: leader.id, user_id: user.id, query: params[:query], leader_handle: leader.handle) unless params[:query] == ""
    end

    render json: {gathering: gathering}
  end


  def destroy
    gathering = Gathering.find_by(id: params[:gathering_id])
    gathering.destroy
  end
end
