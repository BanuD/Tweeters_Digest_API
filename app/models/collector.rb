class Collector < ActiveRecord::Base
  has_many    :tweets, dependent: :destroy
  belongs_to  :user
  belongs_to  :leader
end
