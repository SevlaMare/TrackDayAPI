class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      secret = Rails.application.secrets.secret_key_base
      token = JWT.encode({ user_id: @user.id }, secret, 'HS256')
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid Username or Password' }, status: 401
    end
  end
end
