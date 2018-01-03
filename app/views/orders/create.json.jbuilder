json.extract! @order, :id, :paid, :delivered, :user_id, :group_id, :created_at, :updated_at
    
    	json.items @order.order_items do |item|
    	json.name item.item.name
    	json.price item.item.price
    	json.quantity item.quantity
    	end