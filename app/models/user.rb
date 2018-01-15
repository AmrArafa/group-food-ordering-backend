class User < ApplicationRecord
    has_secure_password
    attr_accessor :password_confirmation

    has_many :orders, dependent: :destroy
    has_many :created_groups, class_name: 'Group', foreign_key: :creator_id, dependent: :destroy
    has_many :groups, through: :orders
    has_many :notifications, as: :recipient

    validates :email, :first_name, :last_name,  presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/ }
    validates :password, confirmation: true

    def self.most_user
        mostUser = []
        User.all.each do |user|
            currentUserOrders = {"user" => user, "orderCount" => user.orders.count}
            mostUser << currentUserOrders
        end
        i = 0
        maxOrders = {"user"=>{}, "orderCount"=>0 }
        while i < mostUser.length
            if mostUser[i]['orderCount'] > maxOrders['orderCount']
          maxOrders = mostUser[i]
        end
          i +=1
        end
        return (maxOrders)
    end
    def self.less_user
        return {"user"=>{}, "orderCount"=>0} if User.count === 0
        lessUser = []
        User.all.each do |user|
            currentUserOrders = {"user" => user, "orderCount" => user.orders.count}
            lessUser << currentUserOrders
        end
        i = 0
        minOrders = {"user"=>{}, "orderCount"=>1000000000000 }
        while i < lessUser.length
            if lessUser[i]['orderCount'] <= minOrders['orderCount']
          minOrders = lessUser[i]
        end
          i +=1
        end
        return (minOrders)
    end
end
