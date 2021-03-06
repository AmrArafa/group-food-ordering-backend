class Admin::ItemsController < ApplicationController
    before_action :admin_authenticate_request!
    before_action :set_item, only: [:show, :update, :destroy]
   
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item 
  end


  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    # @item.image = params[:file]
    
    # p @item
    # File.open('somewhere') do |f|
    #   @item.image = f
    # end

    if @item.save
      render :show, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      render :show, status: :ok, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy

    render json: { operation: 'OK' }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.permit(:name, :image, :price)
    end
end
