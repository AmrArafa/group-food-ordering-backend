class Admin::SessionsController < ApplicationController
  def create
    @admin = Admin.find_by email: params[:email]
    if @admin && @admin.authenticate(params[:password])
      render json: response_obj(@admin), status: :ok
    else
      render json: {message: 'Invalid email/password'}, status: :unauthorized
    end
  end

  private
  def response_obj(admin)
    {
      auth_token: JsonWebToken.encode({admin_id: admin.id}),
      email: admin.email,
      first_name: admin.first_name,
      last_name: admin.last_name
    }
  end
end
