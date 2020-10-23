class Api::V1::MeasurementsController < ApplicationController
  # before_action :require_login, only: %i[index create]

  def index
    @measurements = current_user.measurements

    render json: @measurements, status: :ok
  end

  # restricted route
  def create
    @secret = Rails.application.secrets.secret_key_base
    @token = request.headers['Authorization'].split(' ')[0]

    @user_id = JWT.decode(@token, @secret, algorithm: 'HS256')[0]['user_id']

    @current_user = User.find_by(id: @user_id)
    if @current_user
      @body = request.raw_post
      @measurement = @current_user.measurements.build(value: @body[0], measure_id: @body[1]) # @body[1] failing

      if @measurement.save
        render json: { message: 'Measurement registered.' }, status: :ok
      else
        render json: { message: 'Invalid'}, status: 406
      end
    else
      render json: { error: 'Need login first!' }, status: 401
    end
  end

  private

  def measurement_params
    params.permit(:value, :measure_id)
  end
end
