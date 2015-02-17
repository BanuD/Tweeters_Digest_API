class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  after_create :create_leaders

  has_many  :leaders
  has_many  :collectors
  has_many  :tweets, :through => "collectors"



  private
  def create_leaders
    leaders = TwitterData.leader_search
    leaders.each do |leader|
      Leader.create(twitter_id: leader.id, handle: leader.handle, screen_name: leader.screen_name, profile_image_url_https: leader.profile_image_url_https.to_s, name: leader.name, user_id: self.id)
    end
  end

end
