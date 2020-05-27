class Museum < ApplicationRecord
    has_many :posts
    has_many :favorites
    
    validates :name, {presence: true}
    validates :location, {presence: true}
end
