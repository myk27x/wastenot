class DonationsController < ApplicationController

  def index
    @donations = Donation.all
    render json: @donations
  end

  def show
    # TODO needs something filled in here???
    render :json @donation
  end

  def create
    if current_user
      @donation = current_user.donations.create(donation_params)
    else
      @donation = Donor.anonymous.donations.create(donation_params)
    end

    notifier = PickupNotice.new
    Transporter.all.each do |transporter|
      notifier.send_notice(transporter.cell_phone, donation_url(@donation))
    end

    redirect donation_path(@donation.id)
  end

  private
  def donation_params
    params.require(:donation).permit(:address, :city, :zip, :instructions)
  end
end
