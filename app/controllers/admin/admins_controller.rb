class Admin::AdminsController < ApplicationController
  before_action :admin_authenticate_request!
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find params[:id]
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if @admin.update(admin_params)
      render :show, status: :ok, location: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy

    render json: { operation: 'OK' }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      
    end
end
