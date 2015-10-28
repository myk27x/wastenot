class ReceiverController < ApplicationController

  def index
    @receivers = Receiver.all
  end

  def show
    @receiver =  Receiver.find_by(current_user.id)
  end

  # def new
  #   @user = User.new
  #   @receiver = Receiver.new
  # end

  def create
    @user = User.create(user_params)
    @receiver = Receiver.new(receiver_params)
    @receiver.user_id    = current_user.id
    @receiver.user_email = current_user.email
    @receiver.save

    redirect root_path
  end

  def update
    @receiver.update(receiver_params)

    redirect receiver_path(current_user.id)
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def receiver_params
  params.require(:receiver).permit(:org_name, :street_address, :city, :state, :zip, :contact_name, :phone, :has_need, :open, :close, :delivery_instructions)
  end

end
