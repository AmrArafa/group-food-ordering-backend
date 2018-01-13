class Notification < ApplicationRecord
  
  	belongs_to :user, optional: true
	belongs_to :recipient, class_name: "User"
	belongs_to :notifiable, polymorphic: true, optional: true

	scope :of_user, -> (id) { where(user_id: id)}
end
