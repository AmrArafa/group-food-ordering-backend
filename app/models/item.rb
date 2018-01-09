class Item < ApplicationRecord
    
    has_many :order_items, inverse_of: :item, dependent: :destroy
    has_many :orders, through: :order_items, dependent: :destroy
    
    mount_uploader :image, ImageUploader
    
    validates :name, :price,  presence: true
    validates :name, uniqueness: true
end
