class ApplicationController < ActionController::API
  require 'json_web_token'

  def authenticate_request!
    #unless user_present?
    if !current_user.present?
      render json: { message: 'You must be authenticated first'}, status: :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { message: 'l2 7ede2 yala :@'}, status: :unauthorized
  end

  def admin_authenticate_request!
    #unless user_present?
    if !current_admin.present?
      render json: { message: 'You must be authenticated first'}, status: :unauthorized
    end
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { message: 'tal3a mara tanya'}, status: :unauthorized
  end
  private
  def jwt_token
    @jwt_token ||= request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    # @jwt_token ||= request.headers['Authentication-Token']
  end

  def session_info
    @session_info ||= JsonWebToken.decode(jwt_token)
  end

  def current_user
    @current_user ||= User.find session_info[:user_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end
  def current_admin
    @current_admin ||= Admin.find session_info[:admin_id]
  rescue ActiveRecord::RecordNotFound
    nil
  end

  #def user_present?
    #payload_token && session_info && current_user
  #end
end
