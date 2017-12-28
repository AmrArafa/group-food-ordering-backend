class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    validates :quantity, :order_id, :item_id,  presence: true
end
