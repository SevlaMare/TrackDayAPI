class Api::V1::MeasuresController < ApplicationController
  before_action :require_login, only: %i[index]

  def index
    @measures = Measure.all

    render json: @measures, status: :ok
  end

  private

  def measure_params
    params.require(:measure).permit(:name)
  end
end
