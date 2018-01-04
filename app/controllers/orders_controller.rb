class OrdersController < ApplicationController
  before_action :authenticate_request!, :current_user
  before_action :set_user, except: [:index, :show, :create]
  before_action :set_order, only: [:update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = if params[:user_id].present?
                Order.of_user(params[:user_id])
              else
                Order.all
              end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    # @order = @user.orders.find(params[:id])
    @order = Order.find(params[:id])

    # render json: @order, status: :ok
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @current_user.orders.build order_params

    if @order.save
      # render :show, status: :created, location: @order
      # render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update_attributes(order_params)
      render json: @order, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end

  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy

    render json: { operation: 'OK' }, status: :ok
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @user.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:paid, :delivered, :user_id, :group_id, order_items_attributes: [:item_id, :quantity])
    end
end
