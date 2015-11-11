class DonationsController < ApplicationController
  # before_action :authorize, only: :show
  before_action :find_current_user, only: :create

  # TODO implement view to display all donations
  # def index
  #   @donations = Donation.all
  #   render json: @donations
  # end

  def show
    @donations = Array(Donation.find(params[:id]))
    @receivers = Receiver.all.select { |receiver| receiver.available? }
    @mapping   = Mapping.make_map_for(@receivers, @donations)
  end

  def create
    if @user.donor.equal?(nil)
      @donation = Donor.anonymous.donations.build(donation_params)
    else
      @donation = @user.donor.donations.build(donation_params)
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
  def find_current_user
    @user = User.find(current_user)
  end

  def donation_params
    params.require(:donation).permit(:address, :instructions)
  end
end
