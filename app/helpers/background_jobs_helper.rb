module BackgroundJobsHelper

  def self.the_tweets
    all_users = User.all
    all_users.each do |user|
      all_gatherings = user.gatherings
      all_gatherings.each do |gathering|
        leader = Leader.find_by(id: gathering.leader_id)
        tweets = TwitterData.basic_search({handle: leader.handle, query: gathering.query})
        tweets.each { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id) }
      end
    end
  end

end

