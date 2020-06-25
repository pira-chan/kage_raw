class Item < ApplicationRecord
    has_many :item_tags, dependent: :destroy
    has_many :item_suggests, dependent: :destroy
    has_many :tags, through: :item_tags, dependent: :destroy
    has_many :suggests, through: :item_suggests, dependent: :destroy
    

    
    def self.search(search)
      Item.includes(:tags).where(['title LIKE? OR adopt_tag LIKE?', "%#{search}%","%#{search}%"]).references(:tags) 
    end
    
    
    # def to_param
    #   return self.dl_id
    # end
    

end
