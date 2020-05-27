class Favorite < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: "user_id"
    belongs_to :target, class_name: "Museum", foreign_key: "museum_id"
    
    validates :user_id, {presence: true}
    validates :museum_id, {presence: true}
end
