class Leader < ActiveRecord::Base
  belongs_to  :user
  has_one     :collector
end
