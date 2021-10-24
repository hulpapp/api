class ManageDonationsController < SecuredController
  before_action :set_manage_donation, only: [:show, :update, :destroy]

  # GET /manage_donations
  # def index
  #   @manage_donations = ManageDonation.all
  #
  #   render json: @manage_donations
  # end

  # GET /manage_donations/1
  def show
    render json: @manage_donation
  end

  # POST /manage_donations
  def create
    @manage_donation = ManageDonation.new(manage_donation_params)

    if @manage_donation.save
      render json: @manage_donation, status: :created, location: @manage_donation
    else
      render json: @manage_donation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /manage_donations/1
  def update
    if @manage_donation.update(manage_donation_params)
      render json: @manage_donation
    else
      render json: @manage_donation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /manage_donations/1
  def destroy
    @manage_donation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_donation
      @manage_donation = ManageDonation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manage_donation_params
      params.permit(:event_id, :donation_id)
    end
end
