class WelcomeController < ApplicationController

  def index
    @user = UserInfo.info(current_user.username) if current_user
  end

end
