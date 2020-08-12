class Request < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: true
  validate :image_type
  validate :image_size
  validates :name, presence: true
  validates :name, length: { maximum: 10 }
  validates :text, length: { maximum: 500 }

  def image_type
    if image.attached?
      unless image.content_type.in?(%('image/jpeg image/png image/jpg'))
        image.purge
        errors.add(:image, "添付ファイルにはjpeg jpg pngファイルを添付してください")
      end
    end
  end

  def image_size
    if image.attached?
      if image.blob.byte_size > 1.megabytes
        image.purge
        errors.add(:image, "画像容量は1MBまでとなっております。")
      end
    end
  end
end
