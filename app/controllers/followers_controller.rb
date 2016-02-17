class FollowersController < ApplicationController

  def index
    @followers = instagram_service.followers
    @following = instagram_service.following
  end

  def instagram_service
    InstagramService.new(current_user.token, current_user.uid)
  end

end
