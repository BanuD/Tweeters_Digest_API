class Collector < ActiveRecord::Base
  has_many    :tweets
  belongs_to  :user
  belongs_to  :leader
end
