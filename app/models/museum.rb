class Museum < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :name, {presence: true}
    validates :location, {presence: true}
end
