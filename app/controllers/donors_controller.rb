class DonorController < ApplicationController

  def index
    @donors = Donor.all
    render :json @donors
  end

  def show
    @donor = Donor.find_by(current_user.id)
  end

  def create
    @donor = Donor.new(donor_params)
    @donor.user_id    = current_user.id
    @donor.user_email = current_user.email
    @donor.save

    redirect root_path
  end

  private

  def donor_params
  params.require(:donor).permit(:org_name, :street_address, :city, :state, :zip, :contact_name, :phone)
  end

end