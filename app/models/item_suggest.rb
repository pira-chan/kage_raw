class ItemSuggest < ApplicationRecord
  belongs_to :item
  belongs_to :suggest, dependent: :destroy
end
