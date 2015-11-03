class TransportersController < ApplicationController
  before_action :authenticate_user!

  def index
    @transporters = Transporter.all
    render json: @transporters
  end

  def show
    # TODO and again... why the fridge do I need here???
    # @transporter = Tranporter.find_by(current_user.id)
  end

  def create
    @transporter = Transporter.new(transporter_params)

    @transporter.user_id = current_user.id
    @transporter.save

    # redirect root_path
  end

  private
  def transporter_params
    params.require(:transporter).permit(:name, :cell_phone, :open, :close)
  end

end
