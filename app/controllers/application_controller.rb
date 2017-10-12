class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :set_user_info

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def set_user_info
    @user = UserInfo.new(current_user.username) if current_user
  end
end
