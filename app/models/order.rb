class Order < ApplicationRecord
    belongs_to :user
    belongs_to :group, optional: true
    
    has_many :order_items, inverse_of: :order
    has_many :items, through: :order_items
    accepts_nested_attributes_for :order_items

    scope :of_user, -> (id) { where(user_id: id) }

    

    validates :user_id,  presence: true

end
