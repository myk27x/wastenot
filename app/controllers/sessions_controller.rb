class SessionsController < ApplicationController
  respond_to :json, :html

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to # TODO user thing??? where???
      # TODO ALERT? RESPONSE?
    else
      redirect_to root_path
      # TODO ALERT? RESPONSE?
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
