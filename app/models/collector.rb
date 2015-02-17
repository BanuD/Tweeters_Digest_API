class Collector < ActiveRecord::Base
  has_many    :tweets, dependent: :destroy
  belongs_to  :user
  belongs_to  :leader

  validates :leader_id, uniqueness: true
end
