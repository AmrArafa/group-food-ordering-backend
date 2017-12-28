class OrderItemsController < ApplicationController
  before_action  :set_user, :set_order
  before_action :set_order_item, only: [:show, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = @order.order_items
    # render json: @order_item, status: :created
   # render json: @order_item.as_json(include: :item)

  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    @order_item =  @order.order_items.find(params[:id])
    # render json: @order_item, status: :ok
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @order.order_items.build(order_item_params)

    if @order_item.save
      render json: @order_item, status: :created #, location: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    if @order_item.update_attributes(order_item_params)
      render json: @order_item, status: :ok #, location: @order_item
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
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
