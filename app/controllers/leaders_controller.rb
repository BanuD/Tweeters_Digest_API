class LeadersController < ApplicationController

  def create # !!!!! POST /users/:user_id/leaders(.:format) leaders#create
    leaders = TwitterData.leader_search
    leaders.map do |leader|
      Leader.create(twitter_object: leader, user_id: params[:user_id])
    end
    render json: leaders
  end

end
