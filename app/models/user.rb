class User < ActiveRecord::Base
  # def self.from_omniauth(auth)

  #   where(provider: auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  # end

  # def self.create_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     # check if this is returned from twitter like this
  #     user.handle = auth["info"]["nickname"]
  #   end
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.handle     = auth.info.nickname
      user.save
    end
  end

end
