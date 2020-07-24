class Request < ApplicationRecord
    belongs_to :user
    has_one_attached :request_image
    
end
