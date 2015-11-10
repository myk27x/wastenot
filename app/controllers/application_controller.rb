class ApplicationController < ActionController::Base
  respond_to :json, :html

  def current_user # (user_id)
    @current_user ||= User.find(session[:user_id])
  end

  # TODO This needs to be remedied ASAP before going live
  # def authorize
  #   render status: 401 #unless current_user
  # end
end
