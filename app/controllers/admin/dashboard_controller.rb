class Admin::DashboardController < ApplicationController
    before_action :admin_authenticate_request!

  def index 
    @mostItem = Item.calculate_most_item_sold
    @lessItem = Item.calculate_less_item_sold
    @mostUser = User.most_user
    @lessUser = User.less_user
    @totalSold = Order.total_sold
    @totalLastMonth = Order.total_sold_last_month
    @tatalLastday = Order.total_sold_last_day
    @tatalLasthour = Order.total_sold_last_hour

    render :json => {
               :mostItem => @mostItem, 
               :lessItem => @lessItem,
               :mostUser => @mostUser,
               :lessUser => @lessUser,
               :totalSold => @totalSold,
               :totalLastMonth => @totalLastMonth,
               :tatalLastday => @tatalLastday,
               :tatalLasthour => @tatalLasthour
               } 
  end


  def mostItem
    @item = Item.calculate_most_item_sold
    render json: @item, status: :ok
  end
   def lessItem
    @item = Item.calculate_less_item_sold
    render json: @item, status: :ok
  end
  def mostUser
    @user = User.most_user
    render json: @user, status: :ok
  end
  def lessUser
    @user = User.less_user
    render json: @user, status: :ok
  end
  def totalSold
    @total = Order.total_sold
    render json: @total, status: :ok
  end
  def totalSoldLastMonth
    @total = Order.total_sold_last_month
    render json: @total, status: :ok
  end
  def totalSoldLastday
    @total = Order.total_sold_last_day
    render json: @total, status: :ok
  end
  def totalSoldLasthours
    @total = Order.total_sold_last_hour
    render json: @total, status: :ok
  end
end
