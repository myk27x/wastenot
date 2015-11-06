class DonationsController < ApplicationController

  def index
    @donations = Donation.all
    render json: @donations
  end

  def show
    @donations = Array(Donation.find(params[:id]))
    @receivers = Receiver.all

    procs = Mapping.donations_procs(@donations) + Mapping.receivers_procs(@receivers)

    @hash = Gmaps4rails.build_markers(procs) do |marker_proc, marker|
      marker_proc.call(marker)
    end
  end

  def create
    if current_user
      @donation = current_user.donations.build(donation_params)
    else
      # @donation = Donor.anonymous.donations.build(donation_params)
      # TODO donations doesn't work here? weeeeeiiirrdd...
      @donation = Donation.create(donation_params)
    end
    @donation.save

    notifier = PickupNotice.new
    Transporter.all.each do |transporter|
      if Transporter.available(transporter)
        notifier.send_notice(transporter.cell_phone, donation_url(@donation))
      end
    end

    # redirect donation_path(@donation.id)
    render donation_path(@donation.id)
  end

  private
  def donation_params
    params.require(:donation).permit(:address, :city, :zip, :instructions)
  end
end
