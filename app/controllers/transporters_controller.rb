class TransportersController < ApplicationController
  # before_filter :authorize, only: :show

  # TODO implement view to display all donations
  # def index
  #   @transporters = Transporter.all
  #   render json: @transporters
  # end

  def show
    @transporter = Tranporter.find(current_user(params[:id]))
    render json: @transporter
  end

  def create
    @transporter = Transporter.new(transporter_params)
    @transporter.user_id = current_user(params[:id])

    if @transporter.save
      response status: 201
    else
      redirect_to :back, status: 400
    end
  end

  private
  def transporter_params
    params.require(:transporter).permit(:name, :cell_phone, :open, :close)
  end

end
