class SessionsController < ApplicationController
  def create
    @user = User.find_by email: params[:email]

    if @user && @user.authenticate(params[:password])
      render json: response_obj(@user), status: :ok
    else
      render json: {message: 'Invalid email/password'}, status: :unauthorized
    end
  end

  private
  def response_obj(user)
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    }
  end
end
