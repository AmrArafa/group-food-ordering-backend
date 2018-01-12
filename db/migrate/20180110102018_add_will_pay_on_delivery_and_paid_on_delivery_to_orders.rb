class AddWillPayOnDeliveryAndPaidOnDeliveryToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :will_pay_on_delivery, :boolean, default: false
    add_column :orders, :paid_on_delivery, :boolean, default: false
  end
end
