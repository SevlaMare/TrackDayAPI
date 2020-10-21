class ApplicationController < ActionController::API
  def require_login
    render json: @users, status: :bad_request unless current_user
  end
end
