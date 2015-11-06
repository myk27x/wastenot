class ReceiverController < ApplicationController
  before_filter :authorize, only: [:show]

  def index
    @receivers = Receiver.all
    render json: @receivers
  end

  def show
    @receiver =  Receiver.find_by(current_user.id)
    render json: @receiver
  end

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.user_id    = current_user.id

    if @receiver.save
      render status: 201
    else
      redirect_to :back, status: 400
    end
  end

  private
  def receiver_params
  params.require(:receiver).permit(:org_name, :street_address, :city, :state, :zip, :contact_name, :phone, :has_need, :open, :close, :delivery_instructions)
  end

end
