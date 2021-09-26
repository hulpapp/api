class EventsHaveLocalsController < ApplicationController
  before_action :set_events_have_local, only: [:show, :update, :destroy]

  # GET /events_have_locals
  def index
    @events_have_locals = EventsHaveLocal.all

    render json: @events_have_locals
  end

  # GET /events_have_locals/1
  def show
    render json: @events_have_local
  end

  # POST /events_have_locals
  def create
    @events_have_local = EventsHaveLocal.new(events_have_local_params)

    if @events_have_local.save
      render json: @events_have_local, status: :created, location: @events_have_local
    else
      render json: @events_have_local.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events_have_locals/1
  def update
    if @events_have_local.update(events_have_local_params)
      render json: @events_have_local
    else
      render json: @events_have_local.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events_have_locals/1
  def destroy
    @events_have_local.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_events_have_local
      @events_have_local = EventsHaveLocal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def events_have_local_params
      params.require(:events_have_local).permit(:event_id, :local_id)
    end
end
