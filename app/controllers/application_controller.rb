class ApplicationController < ActionController::API
  def current_user
    current_user = User.find_by(id: cookies[:current_user_id])
    # current_user = User.first

    current_user
  end

  def require_login
    render json: @users, status: :bad_request unless current_user
  end
end
