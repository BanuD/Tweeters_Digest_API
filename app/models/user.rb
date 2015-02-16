class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many  :leaders
  has_many  :collectors
  has_many  :tweets, :through => "collectors"

end
