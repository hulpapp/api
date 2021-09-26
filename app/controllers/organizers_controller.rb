class OrganizersController < ApplicationController
  before_action :set_organizer, only: [:show, :update, :destroy]

  # GET /organizers
  def index
    @organizers = Organizer.all

    render json: @organizers
  end

  # GET /organizers/1
  def show
    render json: @organizer
  end

  # POST /organizers
  def create
    @organizer = Organizer.new(organizer_params)

    if @organizer.save
      render json: @organizer, status: :created, location: @organizer
    else
      render json: @organizer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizers/1
  def update
    if @organizer.update(organizer_params)
      render json: @organizer
    else
      render json: @organizer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizers/1
  def destroy
    @organizer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizer
      @organizer = Organizer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organizer_params
      params.require(:organizer).permit(:volunteer_id)
    end
end
