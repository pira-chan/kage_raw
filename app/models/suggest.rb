class Suggest < ApplicationRecord
        has_many :item_suggests, dependent: :destroy
        has_many :items, through: :item_suggests, dependent: :destroy
        
        
    validates :suggest_tag, presence: true, length: {minimum:1}
    validates :suggest_tag, presence: true, length: {maximum:20} 
end
