class Item < ApplicationRecord
    
    
    
    def self.search(search)
      Item.where(['tag LIKE ? OR title LIKE?', "%#{search}%","%#{search}%"])
    end
    
    
    def to_param
      return self.dl_id
    end
end
