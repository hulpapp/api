class DonationsController < SecuredController
  before_action :set_donation, only: [:show, :update, :destroy]

  # GET /donations
  # def index
  #   @donations = Donation.all
  #
  #   render json: @donations
  # end

  # GET /donations/1
  def show
    render json: @donation
  end

  def create_donation_assoc_to_event
    @donation = Donation.new(donation_params)

    if @donation.save
      @md = ManageDonation.create(event_id: params[:event_id], donation_id: @donation.id)
      render json: @donation, status: :created, location: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end


  end

  # POST /donations
  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      render json: @donation, status: :created, location: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /donations/1
  def update
    if @donation.update(donation_params)
      render json: @donation
    else
      render json: @donation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donation_params
      params.permit( :event_id, :category, :quantity, :position, :destination)
    end
end
