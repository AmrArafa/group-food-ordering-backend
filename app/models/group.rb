class Group < ApplicationRecord
     belongs_to :creator, class_name: 'User'
     has_many :orders
     has_many :users, through: :orders
     accepts_nested_attributes_for :orders
     validates :creator_id, presence: true

     scope :active, lambda { where('time_frame > ?', Time.now.strftime('%Y-%m-%d %H:%M:%S')) }
end
