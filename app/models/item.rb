class Item < ApplicationRecord
    
    has_many :order_items, inverse_of: :item
    has_many :orders, through: :order_items
    
    mount_uploader :image, ImageUploader
    
    validates :name, :price,  presence: true
    validates :name, uniqueness: true

    def self.calculate_most_item_sold
      itemsQuantity = []
      Item.all.each do |item|
        totalQuantity = 0
        currentItem = {"item" => {}, "quantity" => 0}

        item.order_items.each do |order_item|
          totalQuantity += order_item.quantity
        end

        currentItem["item"] = item
        currentItem["quantity"] = totalQuantity
        
        itemsQuantity << currentItem
      end
      
      max = {"item"=>{}, "quantity"=>0}
      i = 0
      while i < itemsQuantity.length
        if itemsQuantity[i]['quantity'] > max['quantity']
          max = itemsQuantity[i]
        end
          i +=1
      end
      p max
      return (max)      
    end
    def self.calculate_less_item_sold
      itemsQuantity = []
      Item.all.each do |item|
        totalQuantity = 0
        currentItem = {"item" => {}, "quantity" => 0}

        item.order_items.each do |order_item|
          totalQuantity += order_item.quantity
        end

        currentItem["item"] = item
        currentItem["quantity"] = totalQuantity
        
        itemsQuantity << currentItem
      end
      
      min = {"item"=>{}, "quantity"=>100000}
      i = 0
      while i < itemsQuantity.length
        if itemsQuantity[i]['quantity'] <= min['quantity']
          min = itemsQuantity[i]
        end
          i +=1
      end
      return (min)      
    end
end
