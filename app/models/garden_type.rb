class GardenType < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: {minimum: 3, maximum: 25}
  has_many :vegetable_garden_types
  has_many :vegetables, through: :vegetable_garden_types
end