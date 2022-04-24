class Vegetable < ApplicationRecord
    validates :name, presence:true, length: {minimum: 3, maximum: 50}
    validates :season, presence:true, length: {minimum: 3, maximum: 50}

    belongs_to :user
    has_many :vegetable_garden_types
    has_many :garden_types, through: :vegetable_garden_types
    
    default_scope { order(created_at: :desc) }
    scope :order_az, -> { reorder(name: :asc) }
    scope :order_za, -> { reorder(name: :desc) }
end