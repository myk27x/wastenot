class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to # TODO user thing??? where???
      # TODO ALERT? RESPONSE?
    else
      redirect_to root_path
      # TODO ALERT? RESPONSE?
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
