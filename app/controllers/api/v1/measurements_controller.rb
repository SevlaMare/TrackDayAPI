class Api::V1::MeasurementsController < ApplicationController
  def index
    @secret = Rails.application.secret_key_base
    @token = request.headers['Authorization'].split(' ')[0]

    # TODO: check arg { algorithm: 'HS256' } or slice?
    # verify arg, will check if decrypt algorithm is the correct
    @user_id = JWT.decode(@token, @secret, verify: true, algorithm: 'HS256')[0]['user_id']

    @current_user = User.find_by(id: @user_id)
    return unless @current_user

    @measurements = @current_user.measurements
      .joins(:measure)
      .select('name', 'value', 'created_at')

    if @measurements.exists?
      render json: { data: @measurements }, status: :ok
    else
      render json: { data: 0 }, status: :ok
    end
  end

  def create
    @secret = Rails.application.secret_key_base
    @token = request.headers['Authorization'].split(' ')[0]
    @user_id = JWT.decode(@token, @secret, true, algorithm: 'HS256')[0]['user_id'] # status 500
    @current_user = User.find_by(id: @user_id)

    if @current_user
      @body = JSON.parse(request.raw_post)
      @measurement = @current_user.measurements.build(value: @body['value'], measure_id: @body['measure_id'])

      if @measurement.save
        render json: { message: 'Measurement registered.' }, status: :ok
      else
        render json: { message: 'Invalid' }, status: 406
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
