class Api::V1::MeasurementsController < ApplicationController
  before_action :require_login, only: %i[index create]

  def index
    @measurements = current_user.measurements

    render json: @measurements, status: :ok
  end

  def create
    @measurement = current_user.measurements.build(measurement_params)

    render json: @measures, status: :ok if @measurement.save
  end

  private

  def measurement_params
    params.require(:measurement).permit(:value, :measure_id)
  end
end
