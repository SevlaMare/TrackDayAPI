class Api::V1::SessionsController < ApplicationController
  def create
    if (userx = User.find_by(name: params[:username_in]))

      cookies[:current_user_id] = {
        value: userx.id, expires: Time.now + 7200
      }

    else
      render json: @users, status: :bad_request
    end
  end
end
