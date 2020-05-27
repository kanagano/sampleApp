class User < ApplicationRecord
    has_many :posts
    has_many :likes 
    has_many :favorites
    
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password, {presence: true}
end 

