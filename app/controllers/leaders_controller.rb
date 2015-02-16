class LeadersController < ApplicationController

  def create # POST /users/:user_id/leaders(.:format) leaders#create
    count = 0
    while cursor !=0
      if count%15 == 0
        sleep(15.minutes)
      else
        leaders = TwitterData.leader_search
        count += 1
        leaders.map do |leader|
          Leader.create(twitter_object: leader)
          render json: leaders
        end
      end
    end
  end

end

############ Refactored ###################
# while cursor !=0
#   sleep(15.minutes) if count%15 == 0

#   leaders = TwitterData.leader_search
#   count += 1
#   leaders.map do |leader|
#     Leader.create(twitter_object: leader)
#     render json: leaders
#   end

# end
