class Museum < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :name, {presence: true}
    validates :location, {presence: true}
    validates :introduction, {presence: true}
    validates :image_name, {presence: true}

    attribute :location, :string, default: 'undefined'
    attribute :introduction, :text, default: 'There is no information.'
    attribute :image_name, :string, default: 'default_image.jpg'
end
