json.array! @order_items, partial: 'order_items/order_item', as: :order_item
# json.order_item do
#     json.name @order_item.item.name
#     json.extract!(@order_item, :id, :order_id, :item_id, :quantity, :created_at, :updated_at)
# end
