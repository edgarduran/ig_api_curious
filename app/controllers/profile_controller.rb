class ProfileController < ApplicationController

  def index
    @user_info = instagram_service.current_user_info
  end

  def instagram_service
    InstagramService.new(current_user.token)
  end
end
