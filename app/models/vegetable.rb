class Vegetable < ApplicationRecord
    validates :name, presence:true, length: {minimum: 3, maximum: 50}
    validates :season, presence:true, length: {minimum: 4, maximum: 50}

end