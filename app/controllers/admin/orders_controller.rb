class Admin::OrdersController < ApplicationController
  before_action :admin_authenticate_request!
  before_action :set_order, only: [:update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order(created_at: :DESC)
  end
  def filter
    @orders = if params[:created_at].present?
                if   params[:created_at] == "Last Hour"
                  Order.where(created_at: 1.hour.ago..Time.now).order(created_at: :DESC)
                elsif params[:created_at] == "Last Day"
                  Order.where(created_at: 1.day.ago..Time.now).order(created_at: :DESC)
                elsif params[:created_at] == "Last Week"
                  Order.where(created_at: 1.week.ago..Time.now).order(created_at: :DESC)
                elsif params[:created_at] == "Last Month"
                  Order.where(created_at: 1.month.ago..Time.now).order(created_at: :DESC)                   
                else
                  Order.all.order(created_at: :DESC)
                end
              else
                Order.all.order(created_at: :DESC)
              end
    render :index, status: :ok
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    render json: @order, status: :ok

  end

  def update
    if @order.update_attributes(order_params)
      render json: @order, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @order.destroy

    render json: { operation: 'OK' }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.permit(:paid_online, :will_pay_on_delivery, :paid_on_delivery, :delivered, :user_id, :group_id, order_items_attributes: [:quantity, :item_id])
    end
end
