class LeadersController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    all_leaders = user.leaders
    render json: {all_leaders: all_leaders}
  end

end
