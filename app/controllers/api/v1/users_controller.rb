class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def create; end
end
