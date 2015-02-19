class Leader < ActiveRecord::Base
  belongs_to  :user
  has_one     :gathering

  # # This validates that every leader has only one gathering.
  validates :twitter_id, uniqueness: true
end
