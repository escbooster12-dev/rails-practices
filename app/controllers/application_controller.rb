class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_user?
      flash[:error] = 'You must be logged to perform that action'
      redirect_to login_path
    end
  end
end
