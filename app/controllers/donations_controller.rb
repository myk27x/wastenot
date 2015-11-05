class DonationsController < ApplicationController

  def index
    @donations = Donation.all
    render json: @donations
  end

  def show
    @donation = Donation.find(params[:id])
    # render json: @donation
    @hash = Gmaps4rails.build_markers(@donation) do |donation, marker|
      marker.lat donation.latitude
      marker.lng donation.longitude
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
        ## TODO REMOVE DOMAIN!!!! , domain: "wastenot.com"
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
