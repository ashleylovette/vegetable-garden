class Vegetable < ApplicationRecord
    validates :name, presence:true, length: {minimum: 6, maximum: 50}
    validates :season, presence:true, length: {minimum: 6, maximum: 50}

end