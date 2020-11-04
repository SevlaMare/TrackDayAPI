class Api::V1::UsersController < ApplicationController
  def create
    # parse data from request (params)
    @user = User.create(user_params)

    # retrieve key
    @secret = Rails.application.secret_key_base

    # new user validation passing
    if @user.valid?
      # generate token
      @token = JWT.encode({ user_id: @user.id }, @secret, 'HS256')

      # response with token
      render json: { user: @user, token: @token }
    else
      render json: { error: 'Try other user/password' }, status: 401
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
