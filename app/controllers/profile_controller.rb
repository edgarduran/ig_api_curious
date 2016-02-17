class ProfileController < ApplicationController

  def index
    @user_info = instagram_service.current_user_info
    @images    = instagram_service.user_images
  end

  def instagram_service
    InstagramService.new(current_user.token, current_user.uid)
  end
end
