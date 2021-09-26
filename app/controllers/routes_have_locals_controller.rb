class RoutesHaveLocalsController < ApplicationController
  before_action :set_routes_have_local, only: [:show, :update, :destroy]

  # GET /routes_have_locals
  def index
    @routes_have_locals = RoutesHaveLocal.all

    render json: @routes_have_locals
  end

  # GET /routes_have_locals/1
  def show
    render json: @routes_have_local
  end

  # POST /routes_have_locals
  def create
    @routes_have_local = RoutesHaveLocal.new(routes_have_local_params)

    if @routes_have_local.save
      render json: @routes_have_local, status: :created, location: @routes_have_local
    else
      render json: @routes_have_local.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /routes_have_locals/1
  def update
    if @routes_have_local.update(routes_have_local_params)
      render json: @routes_have_local
    else
      render json: @routes_have_local.errors, status: :unprocessable_entity
    end
  end

  # DELETE /routes_have_locals/1
  def destroy
    @routes_have_local.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routes_have_local
      @routes_have_local = RoutesHaveLocal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routes_have_local_params
      params.require(:routes_have_local).permit(:route_id, :local_id)
    end
end
