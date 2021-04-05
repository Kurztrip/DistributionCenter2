class DistributionCentersController < ApplicationController
  before_action :set_distribution_center, only: [:show, :update, :destroy]

  # GET /distribution_centers
  def index
    @distribution_centers = DistributionCenter.all

    render json: @distribution_centers
  end

  # GET /distribution_centers/1
  def show
    render json: @distribution_center
  end

  # POST /distribution_centers
  def create
    @distribution_center = DistributionCenter.new(distribution_center_params)

    if @distribution_center.save
      render json: @distribution_center, status: :created, location: @distribution_center
    else
      render json: @distribution_center.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /distribution_centers/1
  def update
    if @distribution_center.update(distribution_center_params)
      render json: @distribution_center
    else
      render json: @distribution_center.errors, status: :unprocessable_entity
    end
  end

  # DELETE /distribution_centers/1
  def destroy
    @distribution_center.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distribution_center
      @distribution_center = DistributionCenter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def distribution_center_params
      params.require(:distribution_center).permit(:address, :latitude_location, :longitude_location, :total_space, :available_space)
    end
end
