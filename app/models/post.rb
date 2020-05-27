class Post < ApplicationRecord
    belongs_to :target, class_name: "Museum", foreign_key: "museum_id"
    belongs_to :writer, class_name: "User", foreign_key: "user_id"
    has_many :likes
    
    validates :content, {presence: true, length: {maximum: 200}}
    validates :user_id, {presence: true}
    validates :museum_id, {presence: true}
end
