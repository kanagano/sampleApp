class Favorite < ApplicationRecord
    validates :user_id, {presence: true}
    validates :museum_id, {presence: true}
end
