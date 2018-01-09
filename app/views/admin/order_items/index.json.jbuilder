# json.array! @order_items, partial: 'order_items/order_item', as: :order_item
# json.order_item  @order_items do
#     json.name @order_item.item.name
#     json.extract!(@order_item, :id, :order_id, :item_id, :quantity, :created_at, :updated_at)
# end
json.array! @order_items do |item|
    json.id item.id
    json.order_id item.order_id
    json.item_name item.item.name
    json.item_pirce item.item.price
    json.quantity item.quantity
    json.created_at item.created_at
end