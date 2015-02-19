module BackgroundJobsHelper

  def self.tweets_for_all_users
    all_users = User.all
    all_users.each do |user|
      all_gatherings = user.gatherings
      all_gatherings.each do |gathering|
        leader = Leader.find_by(id: gathering.leader_id)
        tweets = TwitterData.basic_search({handle: leader.handle, query: gathering.query})
        tweets.each { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id, handle: leader.handle, url: tweet.url.to_s) }
      end
    end
  end

  def self.tweets_for_specific_user(user_id)
    user = User.find_by(id: user_id)
    all_gatherings = user.gatherings
    all_gatherings.each do |gathering|
      leader = Leader.find_by(id: gathering.leader_id)
      tweets = TwitterData.basic_search({handle: leader.handle, query: gathering.query})
      tweets.each { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id, handle: leader.handle, url: tweet.url.to_s) }
    end
  end

end

