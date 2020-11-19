class Api::V1::MeasuresController < ApplicationController
  def index
    @measures = Measure.all

    render json: @measures, status: 200
  end
end
