class Museum < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites
    
    validates :name, {presence: true}
    validates :location, {presence: true}
    validates :introduction, {presence: true}
    validates :image_name, {presence: true}
    validates :opening_time, {presence: true}
    validates :closing_day, {presence: true}

    #locationは全て全角で県名からはじめる
    attribute :location, :string, default: '不明'
    attribute :introduction, :text, default: '詳細な情報がありません'
    attribute :image_name, :string, default: 'default_image.jpg'
    #opening_time, closing_dayは、英数字・記号は半角、それ以外は全角で統一
    attribute :opening_time, :string, default: '不明'
    attribute :closing_day, :string, default: '不明'
end
