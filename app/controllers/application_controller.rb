class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


############# get_tweets not used anymore, just here for tests ###################
  # def get_tweets
  #   # p "authenticate_user! is #{authenticate_user!}"
  #   # p "user_signed_in? is #{user_signed_in?}"
  #   # p "*"*100
  #   # debugger
  #   # p auth_headers["client"]
  #   tweets = TwitterData.basic_search({handle: "DevBootcamp", query: "gym"})
  #   render json: tweets
  # end

  ##############################################################################


  ############ older method - newer one not tested yet #######################
  # def create_leaders
  #   leaders = TwitterData.leader_search
  #   leaders.map do |leader|
  #     Leader.create(twitter_object: leader)
  #   render json: leaders
  # end

########################## new method - moved to leaders controller #############################
  # def create_leaders
  #   count = 0
  #   while cursor !=0
  #     if count%15 == 0
  #       sleep(15.minutes)
  #     else
  #       leaders = TwitterData.leader_search
  #       count += 1
  #       leaders.map do |leader|
  #         Leader.create(twitter_object: leader)
  #         render json: leaders
  #       end
  #     end
  #   end
  # end




################## moved to collectors controller ##############################
  # def create_collector(user, leader, query)
  #   user = User.find_by(id: user.id) # !!!!! should be the devise token.
  #   leader = Leader.find_by(name: params[:leader]) # !!!!! needs conditional to account for finding by either name or nickname
  #   collector = Collector.create(leader_id: leader.id, user_id: user.id, query: query)
  #   #created collector now we have to pass collector to basic search to get back tweets
  #   tweets = TwitterData.basic_search({handle: leader.nickname, query: collector.query})

  #   #create tweet objects out of the array of returned tweets.
  #   tweets.map do |tweet|
  #     Tweet.create(collector_id: collector.id, content: tweet)
  #   end
  #     #send tweets to front end in the form of json
  #     render json: tweets
  # end
end
