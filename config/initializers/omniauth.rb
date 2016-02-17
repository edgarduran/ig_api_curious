Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV["IG_CLIENT_ID"], ENV["IG_CLIENT_SECRET"], scope: 'basic public_content follower_list comments relationships likes'
end
