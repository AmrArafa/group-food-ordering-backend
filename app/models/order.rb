class Order < ApplicationRecord
    belongs_to :user
    belongs_to :group, optional: true
    
    has_many :order_items, inverse_of: :order, dependent: :destroy
    has_many :items, through: :order_items
    accepts_nested_attributes_for :order_items

    scope :of_user, -> (id) { where(user_id: id).order('created_at desc') }

    validates :user_id,  presence: true

    after_create :delete_unpaid_orders, :delete_unpaid_single_orders
    after_create_commit :send_notifications, :store_notifications

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

    def delete_unpaid_orders

        if !self.group_id.nil?
             DeleteUnpaidOrdersJob.set(wait: 1.minute).perform_later(self) 
        end 
    end

    def delete_unpaid_single_orders
        if self.group_id.nil?
            DeleteUnpaidSingleOrdersJob.set(wait: 10.minutes).perform_later(self) 
        end                
    end 

    def send_notifications
        if self.group_id.present? && self.group.creator_id != self.user_id
            ActionCable.server.broadcast "notifications:#{self.group.creator_id}", {message: " #{self.created_at.strftime('%Y-%m-%d %H:%M:%S')} - #{self.user.first_name} #{self.user.last_name} joined your group" }
            
        end
    end 
    def store_notifications
        if self.group_id.present? && self.group.creator_id != self.user_id
    Notification.create(action: "#{self.created_at.strftime('%Y-%m-%d %H:%M:%S')} - #{self.user.first_name} #{self.user.last_name} joined your group",
             user_id: self.group.creator_id,
             recipient_id: self.group.creator_id)  
    end   
    end          
       
end   