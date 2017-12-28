class Order < ApplicationRecord
    belongs_to :user
    belongs_to :group
    
    has_many :order_items
    has_many :items, through: :order_items
    accepts_nested_attributes_for :order_items


    

    validates :user_id, :group_id,  presence: true

end
