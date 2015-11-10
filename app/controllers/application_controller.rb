class ApplicationController < ActionController::Base
  respond_to :json, :html

  # INSECURE; BUT OKAY FOR DEMO DAY -- JASON
  def current_user
    @current_user ||= User.find(params[:user_id])
  end

  # TODO This needs to be remedied ASAP before going live
  # def authorize
  #   render status: 401 #unless current_user
  # end
end
