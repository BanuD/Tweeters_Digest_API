module BackgroundJobsHelper

  def user_tweets
    all_users = User.all
    all_users.each do |user|
      all_collectors = user.collectors
      all_collectors.each do |collector|
        leader = Leader.find_by(collector.leader_id)
        tweets = TwitterData.basic_search({handle: leader.twitter_object.nickname, query: collector.query)
        tweets.map { |tweet| Tweet.create(collector_id: collector.id, content: tweet) }
      end
    end
  end

end
