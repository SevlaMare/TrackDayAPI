class Api::V1::UsersController < ApplicationController
  def index
    render json: { hi: 'world' }
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = JWT.encode({ user_id: @user.id }, 's3cr3t', 'HS256')
      render json: { user: @user, token: token }
    else
      render json: { error: 'Try other user/password' }, status: 401
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
