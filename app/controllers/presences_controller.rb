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
      params.require(:presence).permit(:date, :startDate, :endDate, :volunteer_id)
    end
end
