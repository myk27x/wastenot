class DonationsController < ApplicationController
  # before_filter :authorize, only: :show

  def index
    @donations = Donation.all
    render json: @donations
  end

  def show
    puts params[:id]
    @donations = Array(Donation.find(params[:id]))
    @receivers = Receiver.all

    procs = Mapping.receivers_procs(@receivers) + Mapping.donations_procs(@donations)

    @hash = Gmaps4rails.build_markers(procs) do |marker_proc, marker|
      marker_proc.call(marker)
    end
  end

  def create
    if current_user(params[:id])
      @donation = current_user.donor.donations.build(donation_params)
    else
      @donation = Donor.anonymous.donations.build(donation_params)
    end

    if @donation.save
      notifier = PickupNotice.new
      Transporter.all.each do |transporter|
        if transporter.available?
          notifier.send_notice(transporter.cell_phone, donation_url(@donation))
        end
      end
      render json: @donation, status: 200
    else
      redirect_to :back, status: 400
    end
  end

  private
  def donation_params
    params.require(:donation).permit(:address, :instructions)
  end
end
