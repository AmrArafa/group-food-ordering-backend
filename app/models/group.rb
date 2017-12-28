class Group < ApplicationRecord
     belongs_to :creator, class_name: 'User'
     has_many :orders
     has_many :users, through: :orders
     validates :creator_id, presence: true
end
