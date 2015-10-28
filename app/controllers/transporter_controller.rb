class TransporterController < ApplicationController

  def index
    @transporter = Tranporter.find_by(current_user.id)
  end

  def show
    @transporters = Transporter.all
  end

  def create
    @transporter = Transporter.new(transporter_params)
    @transporter.user_id = current_user.id
    @transporter.save

    redirect root_path
  end

  def destroy
  end

  private

  def transporter_params
    params.require(:transporter).permit(:name, :cell_phone, :open, :close)
  end
end
