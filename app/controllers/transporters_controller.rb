class TransportersController < ApplicationController
  before_filter :authorize, only: :show

  def index
    @transporters = Transporter.all
    render json: @transporters
  end

  def show
    @transporter = Tranporter.find(current_user.id)
    render json: @transporter
  end

  def create
    @transporter = Transporter.new(transporter_params)
    @transporter.user_id = current_user.id

    if @transporter.save
      response status: 201
    else
      redirect_to root_path, status: 400
    end
  end

  private
  def transporter_params
    params.require(:transporter).permit(:name, :cell_phone, :open, :close)
  end

end
