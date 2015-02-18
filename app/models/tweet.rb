class Tweet < ActiveRecord::Base
  belongs_to  :gathering

  validates :gathering_id, uniqueness: true
end
