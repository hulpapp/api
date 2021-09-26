class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :update, :destroy]

  # GET /locals
  def index
    @locals = Local.all

    render json: @locals
  end

  # GET /locals/1
  def show
    render json: @local
  end

  # POST /locals
  def create
    @local = Local.new(local_params)

    if @local.save
      render json: @local, status: :created, location: @local
    else
      render json: @local.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locals/1
  def update
    if @local.update(local_params)
      render json: @local
    else
      render json: @local.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locals/1
  def destroy
    @local.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def local_params
      params.require(:local).permit(:name, :address_id)
    end
end
