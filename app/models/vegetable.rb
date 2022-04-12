class Vegetable < ApplicationRecord
    validates :name, presence:true, length: {minimum: 3, maximum: 50}
    validates :season, presence:true, length: {minimum: 3, maximum: 50}
    belongs_to :user
    has_many :vegetable_garden_types
    has_many :garden_types, through: :vegetable_garden_types
end