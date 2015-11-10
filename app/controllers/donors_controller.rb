class DonorsController < ApplicationController
  # before_filter :authorize, only: :show

  # # TODO implement view to display all donations
  # def index
  #   @donors = current_user.donors.all
  #   render json: @donors
  # end

  # GET /donors
  def show
    # @donor = Donor.find_by_user_id(@user.id)
    @donor = current_user.donor
    render json: @donor
  end

  def create
    @donor = Donor.new(donor_params)
    @donor.user_id = @user.id

    if @donor.save
      render status: 201
    else
      redirect_to :back, status: 400
    end
  end

  private
  def donor_params
  params.require(:donor).permit(:org_name, :street_address, :contact_name, :phone)
  end

  def current_user_params
    params.require(:donor).permit(:id)
  end
end
