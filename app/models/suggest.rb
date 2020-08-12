class Suggest < ApplicationRecord
  has_many :item_suggests
  has_many :items, through: :item_suggests

  validates :suggest_tag, presence: true, length: { minimum: 1 }
  validates :suggest_tag, presence: true, length: { maximum: 20 }
end
