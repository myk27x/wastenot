class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: 202
      # render nothing: true
    else
      render nothing: true, status: 400
    end
  end

  def destroy
    session[:user_id] = nil
    render nothing: true
  end
end
