class SessionsController < ApplicationController
  def new
    render 'identities/new'
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to '/payments', notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Signed out!"
  end

  def failure
    redirect_to '/auth/identity/', alert: "Authentication failed, please try again."
  end
end
