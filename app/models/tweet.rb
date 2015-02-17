class Tweet < ActiveRecord::Base
  belongs_to  :gathering

  validates :tweet_id, uniqueness: true
end
