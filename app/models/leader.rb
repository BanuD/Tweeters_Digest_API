class Leader < ActiveRecord::Base
  belongs_to  :user
  has_one     :collector

  # # This validates that every leader has only one collector. This won't create a problem in the case where two users are following the same leader because these leaders are saved seperately, thus have different ids.
  validates :twitter_id, uniqueness: true
end
