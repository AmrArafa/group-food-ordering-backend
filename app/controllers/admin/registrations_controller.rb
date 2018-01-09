class Admin::RegistrationsController < ApplicationController
  def show
    @admin = Admin.find_by invitation_token: params[:invitation_token]

    if @admin
      render json: @admin, status: :ok
    else
      render json: {message: 'Invalid invitation token'}, status: :not_found
    end
  end

  def update
    @admin = Admin.find_by invitation_token: admin_params[:invitation_token]

    if @admin.accept_invitation!(admin_params)
      render json: @admin, status: :ok
    else
      render json: @admin.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :first_name, :last_name, :password, :password_confirmation, :invitation_token)
  end

end