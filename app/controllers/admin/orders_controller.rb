class Admin::OrdersController < ApplicationController
  before_action :admin_authenticate_request!
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    render json: @order, status: :ok

  end

  def destroy
    @order.destroy

    render json: { operation: 'OK' }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @user.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:paid, :delivered, :user_id, :group_id, order_items_attributes: [:quantity, :item_id])
    end
end
