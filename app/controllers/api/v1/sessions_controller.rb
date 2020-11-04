class Api::V1::SessionsController < ApplicationController
  def create
    # parse data from request (params)
    @user = User.find_by(username: params[:username])

    # retrieve key
    @secret = Rails.application.secret_key_base

    # user exist and pass match after decrypt
    if @user&.authenticate(params[:password])
      # generate token
      @token = JWT.encode({ user_id: @user.id }, @secret, 'HS256')

      # response with token
      render json: { user: @user, token: @token }
    else
      render json: { error: 'Invalid Username or Password' }, status: 401
    end
  end
end
