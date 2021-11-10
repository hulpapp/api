class EventPlacesController < SecuredController
  before_action :set_event_place, only: [:show, :update, :destroy]

  # GET /event_places
  def index
    @event_places = EventPlace.all

    render json: @event_places
  end

  # GET /event_places/1
  def show
    render json: @event_place
  end

  # POST /event_places
  def create
    @event_place = EventPlace.new(event_place_params)

    if @event_place.save
      render json: @event_place, status: :created, location: @event_place
    else
      render json: @event_place.errors, status: :unprocessable_entity
    end
  end

  def find_by_event
    @event_places = EventPlace.where(event_id: params[:event_id])

    render json: @event_places

  end

  # PATCH/PUT /event_places/1
  def update
    if @event_place.update(event_place_params)
      render json: @event_place
    else
      render json: @event_place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_places/1
  def destroy
    @event_place.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_place
      @event_place = EventPlace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_place_params
      params.permit(:event_id, :placeid, :name, :address, :lat, :long)
    end
end
