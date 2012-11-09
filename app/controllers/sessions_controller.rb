class SessionsController < ApplicationController
  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
           User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:user_github_oauth_token] = auth.credentials.token

    redirect_to root_url, :notice => "Logged in!"
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end
end
