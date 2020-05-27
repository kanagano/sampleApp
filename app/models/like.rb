class Like < ApplicationRecord
    belongs_to :owner, class_name: "User", foreign_key: "user_id"
    belongs_to :target, class_name: "Post", foreign_key: "post_id"
    
    validates :user_id, {presence: true}
    validates :post_id, {presence: true}
end
