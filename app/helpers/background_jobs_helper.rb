module BackgroundJobsHelper

  def self.tweets_for_all_users
    all_users = User.all
    all_users.each do |user|
      tweet_count_initial = user.tweets.count

      all_gatherings = user.gatherings
      all_gatherings.each do |gathering|
        leader = Leader.find_by(id: gathering.leader_id)
        tweets = TwitterData.basic_search({handle: leader.handle, query: gathering.query})
        tweets.each { |tweet| Tweet.create(gathering_id: gathering.id, content: tweet.text, tweet_id: tweet.id, handle: leader.handle, url: tweet.url.to_s) }

        tweet_count_after_search = tweets.count

        if tweet_count_initial != 0 && (tweet_count_after_search > tweet_count_initial)
          message = "You have new important tweets from #{leader.handle}, regarding #{gathering.query}.Checkout your Tweeter's Digest!"
          TwilioApi.send_text(gathering.phone_number, message)
        end
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

