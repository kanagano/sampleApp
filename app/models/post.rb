class Post < ApplicationRecord
    belongs_to :target, class_name: "Museum", foreign_key: "museum_id"
    belongs_to :writer, class_name: "User", foreign_key: "user_id"
    has_many :likes, dependent: :destroy
    has_many :notifications, dependent: :destroy
    
    validates :content, {presence: true, length: {maximum: 200}}
    validates :user_id, {presence: true}
    validates :museum_id, {presence: true}
    validates :star, {presence: true, numericality: {greater_than: 0}}

    def create_notification_like(current_user)
        temp = Notification.where(
            visitor_id: current_user.id, 
            visited_id: self.user_id,
            post_id: self.id,
            action: 'like'
        )
        if temp.blank?
            notification = Notification.new(
                visitor_id: current_user.id,
                visited_id: self.user_id,
                post_id: self.id,
                action: 'like'
            )
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
        end
    end
end
