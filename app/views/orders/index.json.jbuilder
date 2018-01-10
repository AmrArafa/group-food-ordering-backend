json.array! @orders do |order|
    json.id order.id
    json.paid order.paid
    json.delivered order.delivered
    json.user_id order.user_id
    json.group_id order.group_id
    json.created_at order.created_at
    if order.group_id.blank?
    	json.items order.order_items do |item|
    	json.name item.item.name
    	json.price item.item.price
    	json.quantity item.quantity
    end
	json.totalPrice order.calculate_total_price
    else	
    json.time_frame order.group.time_frame
    json.items order.order_items do |item|
    	json.name item.item.name
    	json.price item.item.price
    	json.quantity item.quantity
    end
	json.totalPrice order.calculate_total_price
	end
end