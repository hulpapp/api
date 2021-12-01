class PresencesController < ApplicationController
  before_action :set_presence, only: [:show, :update, :destroy]

  # GET /presences
  def index
    @presences = Presence.all

    render json: @presences
  end

  # GET /presences/1
  def show
    render json: @presence
  end

  #GET by volunteer and event
  def find_presence_by_volunteer_and_event

    @presence = Presence.where(volunteer_id: params[:volunteer_id], event_id: params[:event_id])

      if !@presence.nil?
        @vol = Volunteer.find params[:volunteer_id]
        @event = Event.find params[:event_id]

        render json: {
          volunteer: @vol.as_json,
          event: @event.as_json,
          date: @presence[0].date,
          startDate: @presence[0].startDate,
          endDate:@presence[0].endDate
        }
      else
        render json: "404"
      end
  end

  # POST /presences
  def create
    @presence = Presence.new(presence_params)

    if @presence.save
      render json: @presence, status: :created, location: @presence
    else
      render json: @presence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /presences/1
  def update
    if @presence.update(presence_params)
      render json: @presence
    else
      render json: @presence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /presences/1
  def destroy
    @presence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presence
      @presence = Presence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presence_params
      params.require(:presence).permit(:date, :startDate, :endDate, :volunteer_id, :event_id)
    end
end
