class Admin::RegistrationsController < ApplicationController
    def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: @admin, status: :created, location: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
