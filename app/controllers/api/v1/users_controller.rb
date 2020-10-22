class Api::V1::UsersController < ApplicationController
  before_action :require_login, only: %i[show]

  # for test only
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  # for test only
  def show
    render json: 'fine', status: :ok
  end

  # POST request for new user
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
