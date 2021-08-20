class TrainmentsController < SecuredController
  before_action :set_trainment, only: [:show, :update, :destroy]

  # GET /trainments
  def index
    @trainments = Trainment.all

    render json: @trainments
  end

  # GET /trainments/1
  def show
    render json: @trainment
  end

  # POST /trainments
  def create
    @trainment = Trainment.new(trainment_params)

    if @trainment.save
      render json: @trainment, status: :created, location: @trainment
    else
      render json: @trainment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainments/1
  def update
    if @trainment.update(trainment_params)
      render json: @trainment
    else
      render json: @trainment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainments/1
  def destroy
    @trainment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainment
      @trainment = Trainment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainment_params
      params.require(:trainment).permit(:name, :description, :address)
    end
end
