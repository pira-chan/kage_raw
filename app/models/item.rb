class Item < ApplicationRecord

    
    validates :suggest, {length: {minimum:1}}
    validates :suggest, {length: {maximum:20}}
    
    def self.search(search)
      Item.where(['tag LIKE ? OR title LIKE? OR tag2 LIKE ? OR tag3 LIKE ? OR tag4 LIKE ? OR tag5 LIKE ? OR tag6 LIKE ? OR tag7 LIKE ? OR tag8 LIKE ? OR tag9 LIKE ? OR tag10 LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    end
    
    
    # def to_param
    #   return self.dl_id
    # end
    

end
