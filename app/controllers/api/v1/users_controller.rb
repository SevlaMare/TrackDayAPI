class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.valid?
      secret = Rails.application.secrets.secret_key_base
      token = JWT.encode({ user_id: @user.id }, secret, 'HS256')
      render json: { user: @user, token: token }, status: 200
    else
      render json: { error: 'Try other user/password' }, status: 401
    end
  end

  # --- TEST ONLY ---
  def show
    token = request.headers['Authorization'].split(' ')[0]
    secret = Rails.application.secrets.secret_key_base
    user_id = JWT.decode(token, secret, true, algorithm: 'HS256')[0]['user_id']

    @user = User.find_by(id: user_id)
    if @user
      render json: @user
    else
      render json: { error: 'Need login first'}, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
