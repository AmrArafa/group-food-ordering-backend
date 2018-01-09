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
    def self.total_sold
        totalPrice = 0 
        Order.all.each do |order|
            totalPrice += order.calculate_total_price
        end
        return totalPrice
    end
    def self.total_sold_last_month
        totalPrice = 0 
        Order.where(created_at: 1.month.ago.beginning_of_day..Time.now).each do |order|
            totalPrice += order.calculate_total_price
        end
        return totalPrice
    end
    def self.total_sold_last_day
        totalPrice = 0 
        Order.where(created_at: 1.day.ago..Time.now).each do |order|
            totalPrice += order.calculate_total_price
        end
        return totalPrice
    end
    def self.total_sold_last_hour
        totalPrice = 0 
        Order.where(created_at: 1.hours.ago..Time.now).each do |order|
            totalPrice += order.calculate_total_price
        end
        return totalPrice
    end

end
