class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
           User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:user_github_oauth_token] = auth.credentials.token
    cookies[:user_id] = user.id
    cookies[:user_name] = user.name
    flash[:info] = "Logged in!"
    redirect_to session[:return_to] || root_url
  end

  def destroy
    reset_session
    flash[:info] = "Logged out!"
    redirect_to root_url
  end
end
