class DonorController < ApplicationController
  before_filter :authorize, only: :show

  def index
    @donors = Donor.all
    render json: @donors
  end

  def show
    @donor = Donor.find(current_user.id)
    render json: @donor
  end

  def create
    @donor = Donor.new(donor_params)
    @donor.user_id    = current_user.id

    if @donor.save
      render status: 201
    else
      redirect_to :back, status: 400
    end
  end

  private

  def donor_params
  params.require(:donor).permit(:org_name, :street_address, :city, :state, :zip, :contact_name, :phone)
  end

end
