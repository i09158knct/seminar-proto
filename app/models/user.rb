class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.create_with_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
    end
  end
end
