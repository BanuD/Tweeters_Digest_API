class GatheringsController < SecuredController

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
    gathering.destroy if gathering


    relevant_tweets = TwitterData.basic_search({handle: leader.handle, query: params[:query]}).count
    all_tweets = TwitterData.complete_search({handle: leader.handle}).count
    all_tweets = 0.01 if all_tweets == 0
    ratio = (relevant_tweets.to_f / all_tweets).round(2)

    phone_number = params[:phone_number] || ""

    gathering = Gathering.create(leader_id: leader.id, user_id: user.id, query: params[:query], leader_handle: leader.handle, relevant_tweets: relevant_tweets, all_tweets: all_tweets, ratio: ratio, phone_number: phone_number, leader_pic_url: leader.profile_image_url_https) unless params[:query] == ""

    leader.query = params[:query]
    leader.save

    render json: {gathering: gathering}
  end


  def destroy
    gathering = Gathering.find_by(id: params[:gathering_id])
    gathering.destroy
  end
end
