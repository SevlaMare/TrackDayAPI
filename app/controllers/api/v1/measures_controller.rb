class Api::V1::MeasuresController < ApplicationController
  def index
    @measures = Measure.all

    render json: @measures, status: :ok
  end

  private

  def measure_params
    params.require(:measure).permit(:name)
  end
end
