class TeamsHaveVolunteersController < ApplicationController
  before_action :set_teams_have_volunteer, only: [:show, :update, :destroy]

  # GET /teams_have_volunteers
  def index
    @teams_have_volunteers = TeamsHaveVolunteer.all

    render json: @teams_have_volunteers
  end

  # GET /teams_have_volunteers/1
  def show
    render json: @teams_have_volunteer
  end

  # POST /teams_have_volunteers
  def create
    @teams_have_volunteer = TeamsHaveVolunteer.new(teams_have_volunteer_params)

    if @teams_have_volunteer.save
      render json: @teams_have_volunteer, status: :created, location: @teams_have_volunteer
    else
      render json: @teams_have_volunteer.errors, status: :unprocessable_entity
    end
  end

  def create_temhvol

    teamshv_response =[]

    teams_h_vol_params.as_json['_json'].each do | thv|

      unless thv.nil?
        @teamshv_response = TeamsHaveVolunteer.new(thv)
        if @teamshv_response.save
          teamshv_response << @teamshv_response
        else
          teamshv_response << "The #{thv} did not succeed"
        end
      end

    end

    render json: teamshv_response

  end

  # PATCH/PUT /teams_have_volunteers/1
  def update
    if @teams_have_volunteer.update(teams_have_volunteer_params)
      render json: @teams_have_volunteer
    else
      render json: @teams_have_volunteer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams_have_volunteers/1
  def destroy
    @teams_have_volunteer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teams_have_volunteer
      @teams_have_volunteer = TeamsHaveVolunteer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teams_have_volunteer_params
      params.require(:teams_have_volunteer).permit(:team_id, :volunteer_id)
    end


    def teams_h_vol_params
      params.permit( _json: [:team_id, :volunteer_id])
    end
end
