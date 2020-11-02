class Api::V1::UsersController < ApplicationController
  def create
    @secret = Rails.application.secrets.secret_key_base
    @user = User.create(user_params)

    if @user.valid?
      @token = JWT.encode({ user_id: @user.id }, @secret, 'HS256')
      render json: { user: @user, token: @token }
    else
      render json: { error: 'Try other user/password' }, status: 401
    end
  end

  # restricted route
  def show
    @secret = Rails.application.secrets.secret_key_base
    @token = request.headers['Authorization'].split(' ')[0]
    @user_id = JWT.decode(@token, @secret, algorithm: 'HS256')[0]['user_id']

    @user = User.find_by(id: @user_id)
    if @user
      render json: @user
    else
      render json: { error: 'Need login first' }, status: 401
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
