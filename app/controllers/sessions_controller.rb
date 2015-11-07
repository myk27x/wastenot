class SessionsController < ApplicationController
  respond_to :json, :html

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # render json: session, status: 202
      render status: 202
    else
      redirect_to root_path, status: 400
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
