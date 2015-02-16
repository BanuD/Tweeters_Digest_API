class UsersController < ApplicationController
  before_save :create_leaders


  private

  def create_leaders
    leaders = TwitterData.leader_search
    leaders.map do |leader|
      Leader.create(twitter_object: leader, user_id: params[:user_id])
    end
  end
end
