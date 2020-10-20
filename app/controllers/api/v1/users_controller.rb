class Api::V1::UsersController < ApplicationController

  # TODO: remove, test only
  def index
    @users  = User.all

    render json: @users, status: :ok
  end

  # TODO: reject when not save, due validation
  # POST request
  def create
    @user = User.new(user_params)
    @user.save

    render json: @user, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
