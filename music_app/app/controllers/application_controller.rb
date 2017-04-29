class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :ensure_logged_in
  def login(user)
    @user.reset_session_token
    @user.session_token = session[:session_token]
  end

  def logged_in?()
    @false
  end
end
