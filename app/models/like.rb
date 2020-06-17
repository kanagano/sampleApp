class Like < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: "user_id"
    belongs_to :post
    
    validates :user_id, {presence: true}
    validates :post_id, {presence: true}
end
