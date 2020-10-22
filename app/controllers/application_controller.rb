class ApplicationController < ActionController::API
  # ONLY WITH COOKIE
  def current_user
    current_user = User.find_by(id: cookies[:current_user_id])
    # current_user = User.first

    current_user
  end

  def require_login
    render json: @users, status: :bad_request unless current_user
  end


  # TRY JWT JOKEN

  # payload will be user_id
  def encode_JWT(payload, secret)
    SECRET = Rails.application.secrets.secret_key_base
    # SPAM = 16.hours.from_now
    # payload[:exp] = SPAM.to_i

    return JWT.encode(payload, SECRET, 'HS256')
  end

  def decode_JWT(token)
    SECRET = Rails.application.secrets.secret_key_base
    body = JWT.decode(token, SECRET, )[0]

    # ao inves de token como arg
    # token = auth_header.split(' ')[1]
    # header: {'Authorization': 'Bearer <token>'}

    begin
      JWT.decode(body, SECRET, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      # expiration or invalid hash
      nil
    end

  end
end
