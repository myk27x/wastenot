class ApplicationController < ActionController::Base
  # before_filter :authorize

  def current_user(user_id)
    @current_user ||= User.find(user_id)
  end
  # helper_method :current_user

  def authorize
    redirect_to root_path, status: 401 unless current_user
  end
end
