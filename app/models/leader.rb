class Leader < ActiveRecord::Base
  belongs_to  :user
  has_one     :collector

  validates :twitter_id, uniqueness: true
end
