class EventsHaveTeamsController < SecuredController
  before_action :set_events_have_team, only: [:show, :update, :destroy]

  # GET /events_have_teams
  # def index
  #   @events_have_teams = EventsHaveTeam.all
  #
  #   render json: @events_have_teams
  # end

  def show_teams_by_events
    @eventHteams = EventsHaveTeam.where(event_id: params[:id])
    if !@eventHteams.nil?
      render json: @eventHteams
    else
      render json: "404"
    end
  end

  def show_events_by_teams
    @teamsHevents = EventsHaveTeam.where(team_id: params[:id])

    if !@teamsHevents.nil?
      render json: @teamsHevents
    else
      render json: "404"
    end
  end

  # GET /events_have_teams/1
  def show
    render json: @events_have_team
  end

  # POST /events_have_teams
  def create
    @events_have_team = EventsHaveTeam.new(events_have_team_params)

    if @events_have_team.save
      render json: @events_have_team, status: :created, location: @events_have_team
    else
      render json: @events_have_team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events_have_teams/1
  def update
    if @events_have_team.update(events_have_team_params)
      render json: @events_have_team
    else
      render json: @events_have_team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events_have_teams/1
  def destroy
    @events_have_team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_events_have_team
      @events_have_team = EventsHaveTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def events_have_team_params
      params.permit(:event_id, :team_id)
    end
end
