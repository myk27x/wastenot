class ApplicationController < ActionController::Base
  # before_filter :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to root_path, status: 401 unless current_user
  end
end
