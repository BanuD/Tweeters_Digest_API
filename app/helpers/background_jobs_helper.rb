module BackgroundJobsHelper

  def self.the_tweets
    all_users = User.all
    all_users.each do |user|
      all_collectors = user.collectors
      all_collectors.each do |collector|
        leader = Leader.find_by(id: collector.leader_id)
        tweets = TwitterData.basic_search({handle: leader.handle, query: collector.query})
        tweets.each { |tweet| Tweet.create(collector_id: collector.id, content: tweet.text, tweet_id: tweet.id) }
      end
    end
  end

end

