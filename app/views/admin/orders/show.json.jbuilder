json.extract! @order, :id, :paid_online, :will_pay_on_delivery, :paid_on_delivery, :delivered, :user_id, :group_id, :created_at, :updated_at
    
    json.items @order.order_items do |item|
        json.name item.item.name
        json.price item.item.price
        json.quantity item.quantity
    end

json.totalPrice @order.calculate_total_price