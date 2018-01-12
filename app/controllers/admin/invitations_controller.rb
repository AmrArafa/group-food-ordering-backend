class Admin::InvitationsController < ApplicationController
  before_action :admin_authenticate_request!
  
  def create
    @admin = Admin.new admin_params

    if @admin.invite!
      render json: @admin, status: :created
    else
      render json: @admin.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:email)
  end
end
