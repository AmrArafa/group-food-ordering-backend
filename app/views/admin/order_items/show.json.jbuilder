# json.partial! "order_items/order_item", order_item: @order_item.item
# json

# json.order_item do
#     json.name @order_item.item.name
#     json.extract!(@order_item, :id, :order_id, :item_id, :quantity, :created_at, :updated_at)
# end

# json.array! @order_item do |item|
    json.id @order_item.id
    json.order_id @order_item.order_id
    json.item_name @order_item.item.name
    json.item_pirce @order_item.item.price
    json.quantity @order_item.quantity
    json.created_at @order_item.created_at
# end