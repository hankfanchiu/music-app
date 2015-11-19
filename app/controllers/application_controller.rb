class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  protect_from_forgery with: :exception

  def current_user
    current_session_token = session[:session_token]
    @current_user ||= User.find_by(session_token: current_session_token)
  end

  def login_user!(user)
    new_session_token = user.reset_session_token!
    session[:session_token] = new_session_token
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to users_url if logged_in?
  end
end
