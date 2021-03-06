class User < ApplicationRecord

   def self.create_from_oauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.username           = auth_info.info.nickname
      new_user.image              = auth_info.info.image
      new_user.oauth_token        = auth_info.credentials.token #what is up with this syntax for dealing with hashes (the chaining?)
    end
  end


end
