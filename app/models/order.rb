class Order < ApplicationRecord
    belongs_to :user
    belongs_to :group, optional: true
    
    has_many :order_items, inverse_of: :order
    has_many :items, through: :order_items
    accepts_nested_attributes_for :order_items

    scope :of_user, -> (id) { where(user_id: id) }

    

    validates :user_id,  presence: true



    def calculate_total_price
    	totalPrice = 0
		for item in self.order_items 
			totalPrice += ((item.item.price) * (item.quantity))
		end	
		return(totalPrice)
	end

end
