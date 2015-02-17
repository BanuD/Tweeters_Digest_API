class Tweet < ActiveRecord::Base
  belongs_to  :collector

  validates :tweet_id, uniqueness: true
end
