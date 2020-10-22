class Api::V1::SessionsController < ApplicationController

  # LOGIN
  def create
    if (userx = User.find_by(name: params[:name]))

      cookies[:current_user_id] = {
        value: userx.id, expires: Time.now + 7200
      }

      render json: @user, status: :ok

    else
      render json: @users, status: :bad_request
    end
  end

end