class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    validates :quantity, :order_id, :item_id,  presence: true
    def self.sum 
        select ('sum(quantity) AS total').OrderItem.where('item_id':1)
    end
end
