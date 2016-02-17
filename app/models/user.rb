class User < ActiveRecord::Base

  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)
    user.name      = oauth.extra.raw_info['full_name']
    user.user_name = oauth.extra.raw_info['username']
    user.image_url = oauth.extra.raw_info['profile_picture']
    user.uid       = oauth.uid
    user.provider  = oauth.provider
    user.token     = oauth.credentials['token']
    user.save

    user
  end
end
