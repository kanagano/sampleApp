class User < ApplicationRecord
    has_many :posts
    has_many :likes 
    has_many :favorites
    has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy 
    has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
    
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password, {presence: true}
end 

