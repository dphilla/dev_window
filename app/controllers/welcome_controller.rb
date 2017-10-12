class WelcomeController < ApplicationController

  def index
    @user = UserInfo.new(current_user.username) if current_user
    require 'pry'; binding.pry
  end

end
