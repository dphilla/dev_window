class WelcomeController < ApplicationController

  def index
    User.show_basic_info(current_user.username)
  end

end
