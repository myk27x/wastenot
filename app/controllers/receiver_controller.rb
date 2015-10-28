class ReceiverController < ApplicationController

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.user_id    = current_user.id
    @receiver.user_email = current_user.email
    @receiver.save

    redirect root_path
  end

  private

  def receiver_params
  params.require(:receiver).permit(:org_name, :street_address, :city, :state, :zip, :contact_name, :phone, :has_need, :open, :close, :delivery_instructions)
  end

end
