json.extract! @group, :id, :time_frame, :creator_id, :created_at, :updated_at

json.creator_first_name @group.creator.first_name
json.creator_last_name @group.creator.last_name

json.members @group.users do |user|
        json.first_name user.first_name
        json.last_name user.last_name
        json.id user.id
end

json.orders @group.orders do |order|
	json.id order.id
	json.items order.order_items do |item|
		json.name item.item.name
    	json.price item.item.price
    	json.quantity item.quantity
    	end
 end
 
 json.totalPrice @group.calculate_total_price