class VegetableGardenType < ApplicationRecord
  belongs_to :vegetable
  belongs_to :garden_type
end