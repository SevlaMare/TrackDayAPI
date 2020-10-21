class Api::V1::SessionsController < ApplicationController
  # TODO token instead of cookie

  def current_user
    current_user = User.find_by(id: cookies[:current_user_id])
    current_user
  end

  # login
  def create
    if (userx = User.find_by(name: params[:username_in]))

      cookies[:current_user_id] = {
        value: userx.id, expires: Time.now + 7200
      }

      render json: @users, status: :ok
    else
      render json: @users, status: :400
    end
  end
end
