class TransporterController < ApplicationController

  def create
    @transporter = Transporter.new(transporter_params)
    @transporter.user_id = current_user.id
    @transporter.save

    redirect root_path
  end

  private

  def transporter_params
    params.require(:transporter).permit(:name, :cell_phone, :open, :close)
  end
end
