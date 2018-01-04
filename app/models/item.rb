class Item < ApplicationRecord
    
    has_many :order_items, inverse_of: :item
    has_many :orders, through: :order_items
    
    mount_uploader :image, ImageUploader
    validates :name, :price,  presence: true
    validates :name, uniqueness: true
end
