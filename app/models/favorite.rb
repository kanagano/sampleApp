class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :museum 
    
    validates :user_id, {presence: true}
    validates :museum_id, {presence: true}
end
