class Admin::OrderItemsController < ApplicationController
  before_action :admin_authenticate_requestw!
  before_action  :set_user, :set_order
  before_action :set_order_item, only: [:show, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
    # render json: @order_item, status: :created
   # render json: @order_item.as_json(include: :item)

  end
  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy

    render json: { operation: 'OK' }, status: :ok
  end

  private
    def set_user 
      @user = User.find params[:user_id]
    end
    def set_order
      # @order = Order.find params[:order_id]
      @order = @user.orders.find params[:order_id]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = @order.order_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :quantity)
    end
end
