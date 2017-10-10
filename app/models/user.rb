class User < ApplicationRecord

   def self.create_from_oauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.username           = auth_info.nickname
      new_user.oauth_token        = auth_info.credentials.token
    end
  end


end
