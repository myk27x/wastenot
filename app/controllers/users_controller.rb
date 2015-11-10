class UsersController < ApplicationController
  # before_filter :authorize, only: :show

  def show
    @user = current_user
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      render json: @user, status: 201
    else
      render status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
