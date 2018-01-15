# json.array! @items, partial: 'items/item', as: :item
# :id, :name, :image, :price,
json.array! @items do |item|
    json.id item.id
    json.name item.name
    json.image item.image
    json.price item.price
    json.created_at item.created_at
    json.image_url item.image.url


end
