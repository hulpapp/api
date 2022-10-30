class GambisController < SecuredController
  before_action :set_gambi, only: %i[ show update destroy ]

  # GET /gambis
  def index
    @gambis = Gambi.all

    render json: @gambis
  end

  # GET /gambis/1
  def show
    render json: @gambi
  end

  # POST /gambis
  def create
    @gambi = Gambi.new(gambi_params)

    if @gambi.save
      render json: @gambi, status: :created, location: @gambi
    else
      render json: @gambi.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gambis/1
  def update
    if @gambi.update(gambi_params)
      render json: @gambi
    else
      render json: @gambi.errors, status: :unprocessable_entity
    end
  end

  def vol
    @gambi = Gambi.find_by_volunteer_id params[:volunteer_id]
    unless @gambi.nil?
      render json: @gambi
    end
  end

  def event
    @gambi = Gambi.find_by_event_id params[:event_id]
    unless @gambi.nil?
      render json: @gambi
    end
  end

  # DELETE /gambis/1
  def destroy
    @gambi.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gambi
      @gambi = Gambi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gambi_params
      params.require(:gambi).permit(:volunteer_id, :event_id, :supermercado, :horaEntrada, :horaSaida)
    end
end
