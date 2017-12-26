json.partial! "order_items/order_item", order_item: @order_item.item
# json

# json.order_item do
#     json.name @order_item.item.name
#     json.extract!(@order_item, :id, :order_id, :item_id, :quantity, :created_at, :updated_at)
# end