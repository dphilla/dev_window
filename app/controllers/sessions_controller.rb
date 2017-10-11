class SessionsController < ApplicationController

  def create
    if user = User.create_from_oauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_path
  end

end
